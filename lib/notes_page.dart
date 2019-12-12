import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class NotesPage extends StatelessWidget {
  static const String routeName = '/notes';
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      swipe: true,
      offset: IDOffset.only(bottom: 0, top: 0, right: 0, left: 0.5),
      borderRadius: 20,
      leftChild: CustomDrawer(pageName: 'Notes',),
      scaffold: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Notes', style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.start);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(),
        )
      )
    );
  }
}