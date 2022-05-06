import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class AccountRepository {
  fetchBeds() async {
    Dio dio = Dio();
    Response response =
        await dio.get('http://192.168.42.166:8000/api/ListBed/');
    return response.data;
  }
}
