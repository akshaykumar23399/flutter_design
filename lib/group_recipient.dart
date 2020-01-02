import 'package:flutter/material.dart';
import 'package:flutter_ap/privacy.dart';
import 'package:flutter_ap/search.dart';

class GroupRecipient extends StatelessWidget {

  final list = <String>['Sumit', 'Vishal', 'Loki', 'Thor'];
  final ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                /*title: Text("Create Group",
                    style: ts),*/
                background: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Text(
                          'Add People',
                          style: ts.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: FloatingActionButton(
                          tooltip: 'Search People',
                          onPressed: () {
                            showSearch(
                                context: context, delegate: CustomSearch());
                          },
                          backgroundColor: Colors.lightGreenAccent.shade700,
                          child: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) => getItem(index),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.lightGreenAccent.shade700,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Privacy()));
          },
          child: Container(
              height: 40,
              width: screen.width*0.84,
              child: Center(
                child: Text(
                  'Next',
                  style: ts.copyWith(fontSize: 22, color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }

  Widget getItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        height: 60,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              list[index],
              style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              (list[index] == 'Loki')
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.green.shade700,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
