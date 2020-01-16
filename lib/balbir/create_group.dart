import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/balbir/group_recipient.dart';

class CreateGroup extends StatelessWidget {
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
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.close,color: Colors.white,),onPressed: (){},)
                ],
                centerTitle: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Container(
                    height: 300,
                    decoration: BoxDecoration(color: Colors.teal.shade800),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: <Widget>[
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Text('Create Group', style: ts.copyWith(fontSize: 30, color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                Text(
                  "Enter group name",
                  style: ts.copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  style: ts,
                  decoration: InputDecoration(
                      labelText: "Group Name", hintText: "Group Name"),
                ),
                Spacer(),
              ],
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.lightGreenAccent.shade700,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>GroupRecipient()));
          },
          child: Container(
              height: 40,
              width: 310,
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
}
