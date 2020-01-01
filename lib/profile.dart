import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.withOpacity(0.4), width: 1.7),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Groupname', style: ts.copyWith(fontSize: 20, fontWeight: FontWeight.w500),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Public', style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w400),),
                        RichText(
                          text: TextSpan(
                              text: '20'
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
        color: Colors.lightGreenAccent.shade700,
        onPressed: () {},
        child: Container(
          height: 40,
          width: screen.width*0.845,
          child: Center(
            child: Text(
              'Finish',
              style: ts.copyWith(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
