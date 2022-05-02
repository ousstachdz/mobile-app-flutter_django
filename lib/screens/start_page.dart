import 'package:flutter/material.dart';

import 'package:pfe/screens/home_page.dart';
import 'package:pfe/screens/login_page.dart';
import 'package:pfe/services/auth_service.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    check_auth();
  }

  bool check_result = false;
  void check_auth() async {
    bool result = AuthService().is_authenticated as bool;
    setState(() {
      check_result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: check_result ? const HomePage() : const LoginPage());
  }
}
