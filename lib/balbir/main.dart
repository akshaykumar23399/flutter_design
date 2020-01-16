import 'package:flutter/material.dart';
import 'package:flutter_ap/balbir/AuthProvider.dart';
import 'package:flutter_ap/balbir/create_group.dart';
import 'package:flutter_ap/balbir/create_page.dart';
import 'package:flutter_ap/balbir/liked_pages.dart';
import 'package:flutter_ap/balbir/login.dart';
import 'package:flutter_ap/balbir/post.dart';
import 'package:flutter_ap/testing/socketConnections.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<AuthProvider>(
    create: (context) => AuthProvider(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Post(),
    );
  }

  Widget widget(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget widget = Login();

    switch (authProvider.status) {
      case Status.Unauthenticated:
        widget = Login();
        break;

      case Status.Authenticated:
        widget = CreatePage();
        break;
    }
    return widget;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MaterialButton(
        elevation: 10,
        onPressed: () {},
        child: RaisedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateGroup())),
          color: Colors.lightGreenAccent.shade700,
          child: Text(
            'Create a new group',
            style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
          ),
        ),
      ),
    );
  }
}
