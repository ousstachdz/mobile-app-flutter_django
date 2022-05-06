import 'package:flutter/material.dart';

class ListNotifications extends StatefulWidget {
  const ListNotifications({Key? key}) : super(key: key);

  @override
  State<ListNotifications> createState() => _ListNotificationsState();
}

class _ListNotificationsState extends State<ListNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return ListView.builder(itemBuilder: ((context, index) {
      return getCard();
    }));
  }

  Widget getCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('LISTEN'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
