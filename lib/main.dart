import 'package:flutter/material.dart';
import 'package:flutter_ap/create_group.dart';
import 'package:flutter_ap/group_recipient.dart';
import 'package:flutter_ap/profile_new.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: ProfileNew()
    );
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
        onPressed: (){},
        child: RaisedButton(
          onPressed: ()=>

          Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateGroup())),
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
