import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('header', style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                title: Text('item 1'),
                onTap: () {
                  print('test');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Container(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello World',
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'Button',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

