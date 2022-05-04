import 'package:flutter/material.dart';
import 'package:pfe/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _is_invalid = false;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: _is_invalid
              ? const Icon(
                  Icons.error_rounded,
                  color: Colors.red,
                  size: 80.0,
                )
              : const Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                  size: 80.0,
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: username,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            )
          ]),
        ),
      ],
    ));
  }
}
