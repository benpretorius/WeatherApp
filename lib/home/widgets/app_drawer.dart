import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String schoolId;

  AppDrawer({Key key, @required this.schoolId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('Manage',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 22,
                      color: Colors.white)),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              'Test',
              style: TextStyle(fontFamily: 'Grandstander', color: Colors.black),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
