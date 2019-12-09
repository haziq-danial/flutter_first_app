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

class _MyPageState extends State<MyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
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
      AnimatedContainer(
        duration: new Duration(milliseconds: 300),
        child: Material(
          elevation: 8.0,
          child: Scaffold(
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    Center(
                      heightFactor: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                    ),
                  ],
                ),
              ),
            ),
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
