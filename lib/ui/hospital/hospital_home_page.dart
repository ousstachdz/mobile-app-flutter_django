import 'package:flutter/material.dart';

class HospitalHomePage extends StatefulWidget {
  const HospitalHomePage({Key? key}) : super(key: key);

  @override
  State<HospitalHomePage> createState() => _HospitalHomePage();
}

class _HospitalHomePage extends State<HospitalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital'),
      ),
    );
  }
}
