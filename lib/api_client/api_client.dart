

import 'package:dio/dio.dart';

/// Helper class for Api Calls
class ApiHelper {
  static final ApiHelper _apiHelper = ApiHelper._internal();

  factory ApiHelper() {
    return _apiHelper;
  }

  ApiHelper._internal();

  final Dio _dio = Dio();

  Future<Response> getApi({
    required String apiUrl,
  }) async {

    final Response response = await _dio.get(apiUrl);
    return response;
  }
}
