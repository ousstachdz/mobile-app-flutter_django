import 'package:flutter/material.dart';
import 'package:pfe/ui/patient/demand_bed.dart';
import 'package:pfe/ui/shared/listLnotifications.dart';
import 'package:pfe/ui/shared/profile.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePage();
}

class _PatientHomePage extends State<PatientHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const DemandBeds(),
    const Profil(),
    const ListNotifications()
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_individual_suite),
            label: 'Beds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
