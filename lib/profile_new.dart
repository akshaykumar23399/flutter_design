import 'package:flutter/material.dart';

class ProfileNew extends StatefulWidget {
  @override
  _ProfileNewState createState() => _ProfileNewState();
}

class _ProfileNewState extends State<ProfileNew> {
  final ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: Text('Your Page'),
          bottom: TabBar(
            labelPadding: EdgeInsets.all(10),
            tabs: <Widget>[
              Icon(
                Icons.home,
                size: 25,
              ),
              Icon(
                Icons.info_outline,
                size: 25,
              ),
              Icon(
                Icons.settings,
                size: 25,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Image.asset(
                      'assets/island.jpg',
                      height: screen.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://theme4press.com/wp-content/uploads/2015/11/featured-small-circular.jpg'),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 20,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        height: screen.height * 0.12,
                        width: screen.width * 0.4,
                        child: Text(
                          'Sumit Singh',
                          textAlign: TextAlign.center,
                          style: ts.copyWith(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ]),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
