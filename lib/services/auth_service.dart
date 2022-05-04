import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pfe/ui/patient/patient_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login() async {
    const data = {
      'username': 'simo',
      'password': 'aezakmi21',
      'Content-Type': 'application/json'
    };
    Response response;
    var dio = Dio();
    try {
      response =
          await dio.post('http://192.168.42.166:8000/api/token/', data: data);
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access', response.data['access']);
      prefs.setString('refresh', response.data['refresh']);
      print('pass');
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> is_authenticated() async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('access') != null &&
        prefs.getString('refresh') != null) {
      return true;
    } else {
      return false;
    }
  }
}
