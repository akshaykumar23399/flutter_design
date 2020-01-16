import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
              expandedHeight: screen.height*.3,
              floating: false,
              pinned: true,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'Groupname',
                  style: ts.copyWith(fontWeight: FontWeight.w500),
                ),
                background: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      IconButton(
                        onPressed: ()async{
                          File file = await FilePicker.getFile();
                        },
                        icon: Icon(Icons.camera_alt, color: Colors.white,),

                      )

                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Groupname',
                        style: ts.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.public,
                            color: Colors.teal,
                          ),
                          Text(
                            ' Public',
                            style: ts.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.teal.withOpacity(0.6),
                            ),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '20',
                                style: ts.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: ' members',
                                style: ts.copyWith(
                                  color: Colors.teal.withOpacity(0.6),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        radius: 28,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white),
                        width: 250,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextField(
                              style: ts,
                              decoration: InputDecoration(
                                  hintText: 'Post something...',
                                  hintStyle: ts.copyWith(fontSize: 17),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.lightGreenAccent.shade700,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.send,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        radius: 28,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: screen.width,
                height: screen.height * .05,
                child: Card(
                  elevation: 10,
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      'Posts',
                      style: ts.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 18),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/island.jpg',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                        width: screen.width * 0.85,
                        height: screen.height * .3,
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 0,
                      child: Container(
                        height: 35,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13.0),
                            child: Text(
                              'Vishal Sharma sdfj sdf',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  ts.copyWith(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -15,
                      top: -15,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          radius: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.thumb_up,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    '24',
                    style: ts.copyWith(
                        fontSize: 17,
                        color: Colors.teal.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    '64',
                    style: ts.copyWith(
                        fontSize: 17,
                        color: Colors.teal.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    '434',
                    style: ts.copyWith(
                        fontSize: 17,
                        color: Colors.teal.withOpacity(.7),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                      text: "It's been a great time. Thanks ",
                      style: ts.copyWith(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: "@john",
                      style: ts.copyWith(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500))
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final boxWidth = constraints.constrainWidth();
                  final dashWidth = 4.0;
                  final dashHeight = 1.0;
                  final dashCount = (boxWidth / (2 * dashWidth)).floor();
                  return Flex(
                    children: List.generate(dashCount, (_) {
                      return SizedBox(
                        width: dashWidth,
                        height: dashHeight,
                        child: DecoratedBox(
                          decoration:
                              BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                        ),
                      );
                    }),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.horizontal,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
