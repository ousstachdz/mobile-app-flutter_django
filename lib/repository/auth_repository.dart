import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

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
      getUser(response.data['access']);
      return response.data;
    } on DioError catch (e) {
      print(e.message);
    }
  }

  getUser(String token) async {
    var dycriptedData = Jwt.parseJwt(token);
    var id = dycriptedData['user_id'];
    var dio = Dio();
    try {
      Response response = await dio.get(
        'http://192.168.42.166:8000/api/DetailUser/$id',
      );
      return response.data;
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
