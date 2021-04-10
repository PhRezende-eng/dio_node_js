import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onError: _onError, onResponse: _onResponse));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    options.headers['Authorization'] = token;
  }

  _onResponse(Response r) {
    print('##################');
    print(r.data);
    print('##################');
  }

  _onError(DioError e) {
    return e;
  }
}
