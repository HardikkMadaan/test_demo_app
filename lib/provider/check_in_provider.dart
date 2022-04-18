import 'package:flutter/material.dart';
import 'package:test_demo_app/api_client/api_client.dart';
import 'package:test_demo_app/constants.dart';
import 'package:test_demo_app/models/checkIn.dart';

class CheckInProvider extends ChangeNotifier {
  CheckInProvider(String id) {
    fetchEmployeeList(id: id);
  }

  CheckInList? _checkInList;

  CheckInList? get getCheckInList => _checkInList;

  void fetchEmployeeList({
    required String id,
  }) async {
    try {
      final response = await ApiHelper().getApi(
        apiUrl: Constants.baseUrl + Constants.employee + '/$id/checkin',
      );
      _checkInList = CheckInList.fromJson(response.data);
      notifyListeners();
      if(response.statusCode != 200){
        switch (response.statusCode){
          case 201:
            print('OK');
            break;
          case 404:
            print('Not Found');
            break;
          case 500:
            print('Server error');
            break;
          default:
            print('Unauthorized Request');
            break;
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
