import 'package:dio/dio.dart';

class AuthRepository {
  login(String email, String password) async {
    var data = {
      'username': email,
      'password': password,
    };

    var dio = Dio();
    try {
      Response response =
          await dio.post('http://192.168.42.166:8000/api/token/', data: data);
      return response.data;
    } on DioError catch (e) {}
  }
}
