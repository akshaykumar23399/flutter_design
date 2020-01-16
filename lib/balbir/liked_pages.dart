import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LikedPages extends StatefulWidget {
  @override
  _LikedPagesState createState() => _LikedPagesState();
}

class _LikedPagesState extends State<LikedPages> {
  final List<String> list = ['Cars', 'Mobiles', 'Laptop'];
  final _ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Liked Pages'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) =>
              getPages(screen.width, screen.height),
        ));
  }

  Widget getPages(var width, var height) {
    return Container(
      height: 300,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.network(
                'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                height: 100,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20,
              top: 60,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPyKlEV86yRzGsebr3AsVOq88NoMknLrYDrb5vKITcDcIXd_my&s'),
              ),
            ),
            Positioned(
              top: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width:width*0.95,
                    padding: EdgeInsets.only(left:10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Groupname',
                          style: _ts.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '20 members',
                          style: _ts.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w400, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: width*.98,
                    child: Text(
                      'Make sure that your computer and your device are connected to the same WiFi network.'
                          ' Make sure that your computer and your device are connected to the same WiFi network.',
                      style:
                          _ts.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey.withOpacity(0.3),
                    height: 1,
                    width: width,
                  ),
                  Container(
                    width: width*0.98,
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Liked',
                          style: _ts.copyWith(color: Colors.blueGrey.shade600),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person_add,
                            color: Colors.blueGrey.shade700,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Join',
                          style: _ts.copyWith(color: Colors.blueGrey.shade600),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.blueGrey.shade700,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'Share',
                          style: _ts.copyWith(color: Colors.blueGrey.shade600),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
