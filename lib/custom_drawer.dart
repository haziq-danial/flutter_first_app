import 'package:flutter/material.dart';
import 'main.dart';
import 'routes/routes.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class CustomDrawer extends StatelessWidget {
  String pageName = '';
  CustomDrawer({@required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal[700]),
            child: Stack(children: <Widget>[
              Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text("Flutter Step-by-Step",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500))),
            ]),
          ),
          DrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            selected: this.pageName.contains('Home'),
          ),
          DrawerItem(
            icon: Icons.event,
            text: 'Events',
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.events);
            },
            selected: this.pageName.contains('Events'),
          ),
          DrawerItem(
            icon: Icons.note,
            text: 'Notes',
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.notes);
            },
            selected: this.pageName.contains('Notes'),
          ),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;
  final bool selected;

  DrawerItem({this.icon, this.text, this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      selectedColor: Colors.teal[300],
      iconColor: Colors.black,
      child: ListTile(
        leading: Icon(this.icon),
        title: Text(this.text),
        selected: selected,
        onTap: this.onTap,
      ),
    );
  }
}
