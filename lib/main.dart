import 'dart:ui' as prefix0;

import 'package:first_app/events_page.dart';
import 'package:first_app/notes_page.dart';
import 'package:first_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'custom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
              color: Colors.white10,
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white))),
      home: MyPage(),
      routes: {
        Routes.events: (context) => EventsPage(),
        Routes.notes: (context) => NotesPage()
      },
    );
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

  @override
  void initState() {
    super.initState();
  }

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
      leftChild: CustomDrawer(
        pageName: 'Home',
      ),
      scaffold: Stack(
        children: <Widget>[
          Container(
            height: _screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1548291616-bfccc8db731d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1482&q=80')),
            ),
            child: BackdropFilter(
              filter: prefix0.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: OutlineButton(
                borderSide: BorderSide(
                    color: Colors.white, style: BorderStyle.solid, width: 1),
                highlightedBorderColor: Colors.white30,
                shape: StadiumBorder(),
                padding: EdgeInsets.only(
                    bottom: 2.0, top: 2.0, left: 40.0, right: 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'ACCOUNTS',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                onPressed: () {},
              ),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _innerDrawerKey.currentState
                      .toggle(direction: InnerDrawerDirection.start);
                },
              ),
              actions: <Widget>[
                RawMaterialButton(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.lock_open),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                  height: _screenHeight / 4,
                  width: _screenWidth,
                  child: PageView(
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: _screenHeight / 14,
                              left: _screenWidth / 3,
                              child: Text(
                                'RM 422',
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100,
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
