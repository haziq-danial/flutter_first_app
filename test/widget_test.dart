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
  String _stringName = '';
  bool _isCollapse = true;
  AnimationController _animController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(duration: Duration(milliseconds: 30), vsync: this);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
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

    return Stack(children: <Widget>[
      Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('item 1'),
            )
          ],
        ),
      ),
      Positioned(
        child: Material(
          elevation: 8.0,
          child: Scaffold(
            body: Container(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: SafeArea(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: SizedBox(
                          width: 600,
                          height: 200,
                        ),
                      ),
                      Positioned(
                        right: _screenWidth / 1.5,
                        child: Container(
                          color: Colors.blue,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Builder(
                          builder: (context) => Form(
                            key: _formKey,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter String',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a string';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (val) =>
                                        setState(() => _stringName = val),
                                    onTap: () {
                                      final form = _formKey.currentState;
                                      form.reset();
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: RaisedButton(
                                          color: Colors.green,
                                          shape: StadiumBorder(),
                                          child: Text(
                                            'Submit',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            final form = _formKey.currentState;
                                            if (form.validate()) {
                                              form.save();
                                              _showDialog(context, _stringName);
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    ]);
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
