import 'package:dio_node_js/utils/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  login() {
    var _dio = CustomDio().instance;

    _dio.post('http://localhost:3000/login', data: {
      'username': 'paulohenrique',
      'password': 'henrique',
    }).then((res) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res.data['token']);
    }).catchError((err) {
      throw Exception('Login ouu senha inválido');
    });
  }
}
