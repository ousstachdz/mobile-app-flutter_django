import 'package:flutter/material.dart';
import 'package:pfe/ui/admin/admin_home_page.dart';
import 'package:pfe/ui/hospital/hospital_home_page.dart';
import 'package:pfe/ui/patient/patient_home_page.dart';
import 'package:pfe/ui/shared/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/patient': (context) => PatientHomePage(),
        '/hospital': (context) => HospitalHomePage(),
        '/admin': (context) => AdminHomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
