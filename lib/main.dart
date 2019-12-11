import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String _stringName = '';
  bool _isCollapse = true;

  void _showDialog(BuildContext context, String stringName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('test dialog'),
            content: Text(stringName),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _screenHeight = _screenSize.height;
    final _screenWidth = _screenSize.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        toolbarOpacity: 1.0,
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: null,
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text('item 1'),
            onTap: () {
              print('item 1');
            },
          ),
          ListTile(
            title: Text('item 2'),
            onTap: () {
              print('item 2');
            },
          )
        ],
      ),
    );
  }
}
