import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DemandBeds extends StatefulWidget {
  const DemandBeds({Key? key}) : super(key: key);

  @override
  State<DemandBeds> createState() => _DemandBedsState();
}

class _DemandBedsState extends State<DemandBeds> {
  List listBeds = [];
  @override
  void initState() {
    fetchBeds();

    super.initState();
  }

  fetchBeds() async {
    Dio dio = Dio();
    Response response =
        await dio.get('http://192.168.42.166:8000/api/ListBed/');
    if (response.statusCode == 200) {
      setState(() {
        listBeds = response.data;
      });
    } else {
      setState(() {
        listBeds = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: listBeds.length,
        itemBuilder: ((context, index) {
          return getCard(listBeds[index]);
        }));
  }

  Widget getCard(bed) {
    var location = 'Location: ' + bed['location'];
    var category = 'Category: ' + bed['category'];
    var icon;
    if (bed['category'] == 'Normal') {
      icon = Icons.bedroom_child;
    } else {
      if (bed['category'] == 'ICU') {
        icon = Icons.emergency;
      } else {
        icon = Icons.masks;
      }
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(icon),
            title: Text(location),
            subtitle: Text(category),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
