import 'package:flutter/material.dart';
import 'package:pfe/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  AuthRepository repository = AuthRepository();
  String fullname = '';
  String email = '';

  getInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('access');
    print(token);
    var data = await repository.getUser(token!);
    setState(() {
      fullname = data['first_name'] + ' ' + data['last_name'];
      email = data['email'];
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(children: [
              const Icon(Icons.account_circle_sharp, size: 160),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fullname,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 73, 73, 73)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.blue,
                        )),
                  )
                ],
              )
            ])
          ],
        ),
      )),
    );
  }
}
