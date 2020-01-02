import 'package:flutter/material.dart';
import 'package:flutter_ap/profile.dart';

class FinishedScreen extends StatelessWidget {
  final ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 197,
              floating: false,
              pinned: true,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      SizedBox.expand(
                        child: Image.asset(
                          'assets/island.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 90,
              width: 90,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left:10,
                    bottom: 0,
                    child: Card(
                        color: Colors.lightGreenAccent.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          height: 60,
                          width: 60,
                        )),
                  ),
                  Positioned(
                      left: 20,
                      bottom: 5,
                      child: Icon(
                        Icons.check,
                        size: 70,
                        color: Colors.white,
                      )),

                ],
              ),
            )
            /*Icon(Icons.check_circle,
                  size: 80, color: Colors.lightGreenAccent.shade700)*/
            ,
            SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: ts.copyWith(
                      fontSize: 30, color: Colors.blueGrey.shade900),
                  children: [
                    TextSpan(
                        text: 'GroupName',
                        style: ts.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                      text: '\nGroup Created',
                    ),
                  ]),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.lightGreenAccent.shade700,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_)=>Profile()
            ));
          },
          child: Container(
            height: 40,
            width: 310,
            child: Center(
              child: Text(
                'Finish',
                style: ts.copyWith(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
