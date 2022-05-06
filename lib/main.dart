import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/blocs/auth_bloc.dart';
import 'package:pfe/blocs/auth_state.dart';
import 'package:pfe/repository/auth_repository.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(LoginInitState(), AuthRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/patient': (context) => const PatientHomePage(),
          '/hospital': (context) => const HospitalHomePage(),
          '/admin': (context) => const AdminHomePage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
