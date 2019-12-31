import 'package:flutter/material.dart';
import 'package:flutter_ap/create_group.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

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
      home: CreateGroup()/*ChangeNotifierProvider<Counter>(
        builder:(_) => Counter(0),
        child: MyHomePage(title: 'Flutter Demo Home Page')
      ),*/
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
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: <Widget>[
          Spacer(),
          FloatingActionButton(
            onPressed: counter.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: counter.decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
