import 'package:flutter/material.dart';
import 'package:test_demo_app/api_client/api_client.dart';
import 'package:test_demo_app/constants.dart';
import 'package:test_demo_app/models/employee.dart';

class AppProvider extends ChangeNotifier {
  int pageCount = 1;

  AppProvider() {
    fetchEmployeeList(
      page: pageCount,
    );
    addScrollListener();
  }

  ScrollController scrollController = ScrollController();

  EmployeeList? _employeeList;
  bool _isPaginationLoading = false;
  int _selectedIndex = 0;
  String _selectedSort = 'name';
  String _orderBy = 'asc';
  String _search = '';

  final int dataLimit = 10;

  String get search => _search;

  String get selectedSortBy => _selectedSort;

  String get selectedOrderBy => _orderBy;

  int get tabIndex => _selectedIndex;

  bool get isLoading => _isPaginationLoading;

  EmployeeList? get employeeList => _employeeList;

  void setSelectedSearch(String value) {
    _search = value;
    notifyListeners();
  }

  void setSelectedSortBy(String value) {
    _selectedSort = value;
    notifyListeners();
  }

  void setSelectedOrderBy(String value) {
    _orderBy = value;
    notifyListeners();
  }

  void onTabChange(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void startLoading() {
    _isPaginationLoading = true;
    notifyListeners();
  }

  void finishLoading() {
    _isPaginationLoading = false;
    notifyListeners();
  }

  void addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_employeeList != null && !_isPaginationLoading) {
          fetchEmployeeList(
            page: ++pageCount,
          );
        }
      }
    });
  }

  void fetchEmployeeList({
    required int page,
    bool isRefresh = false,
  }) async {
    startLoading();
    if (isRefresh) {
      _employeeList = null;
    }
    try {
      final response = await ApiHelper().getApi(
        apiUrl: Constants.baseUrl +
            Constants.employee +
            '?sortBy=$_selectedSort&order=$_orderBy&page=$page&limit=$dataLimit',
      );
      if (_employeeList != null) {
        _employeeList!.employeeList = _employeeList!.employeeList +
            EmployeeList.fromJson(response.data).employeeList;
      } else {
        _employeeList = EmployeeList.fromJson(response.data);
      }

      notifyListeners();
    } catch (e) {
      print(e.toString());
    } finally {
      finishLoading();
    }
  }

  void searchData(
  ) async {
    try {
      final response = await ApiHelper().getApi(
        apiUrl: Constants.baseUrl +
            Constants.employee +
            '?$_selectedSort=$_search',
      );
      _employeeList = EmployeeList.fromJson(response.data);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
