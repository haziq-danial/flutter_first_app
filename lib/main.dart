import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

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
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
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

    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      swipe: true,
      offset: IDOffset.only(bottom: 0, top: 0, right: 0, left: 0.5),
      borderRadius: 20,
      leftChild: Material(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      scaffold: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _innerDrawerKey.currentState.toggle(
                direction: InnerDrawerDirection.start
              );
            },
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[Text('test')],
            ),
          ),
        ),
      ),
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
