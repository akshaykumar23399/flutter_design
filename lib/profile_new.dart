import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileNew extends StatefulWidget {
  @override
  _ProfileNewState createState() => _ProfileNewState();
}

class _ProfileNewState extends State<ProfileNew> {
  final TextEditingController _postContentController =
      new TextEditingController();
  final _ts = TextStyle(fontFamily: 'Quicksand');

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
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
                  Stack(
                    children: <Widget>[
                      Image.network(
                        'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        height: _screen.height * 0.3,
                        width: _screen.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPyKlEV86yRzGsebr3AsVOq88NoMknLrYDrb5vKITcDcIXd_my&s'),
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
                          height: _screen.height * 0.12,
                          width: _screen.width * 0.4,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: _ts,
                              children: [
                                TextSpan(
                                  text: 'Sumit Singh',
                                  style: _ts.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text:
                                      '\nI am an Android Developer. I am an interesting person',
                                  style: _ts.copyWith(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      width: _screen.width,
                      height: _screen.height * 0.2,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 5,
                                height: _screen.height * 0.14,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade700,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: _screen.width * .9,
                                height: _screen.height * 0.14,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  minLines: 4,
                                  maxLines: 4,
                                  controller: _postContentController,
                                  style: _ts.copyWith(fontSize: 18),
                                  decoration: InputDecoration(
                                      hintText: "What's in your mind..."),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: _screen.height * 0.06,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.image,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.attachment,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.format_bold,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.format_italic,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      color: Colors.blueGrey.shade800,
                      elevation: 5,
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            'Post',
                            style:
                                _ts.copyWith(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children:
                        List.generate(4, ((index) => getPostItemList(_screen)))
                            .toList(),
                  )
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

  Widget getPostItemList(Size _screen) {
    return Card(
      elevation: 5,
      child: Container(
        height: _screen.height * 0.41,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPyKlEV86yRzGsebr3AsVOq88NoMknLrYDrb5vKITcDcIXd_my&s'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sumit Singh',
                        style: _ts.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey.shade800),
                      ),
                      Text(
                        '4hr ago',
                        style: _ts.copyWith(color: Colors.blueGrey.shade600),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.blueGrey.shade700,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: _screen.height * 0.2,
              width: _screen.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Text(
                'Make sure that your computer and your device are connected to the same WiFi network.',
                textAlign: TextAlign.start,
                style: _ts.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.shade800),
              ),
            ),
            Container(
              color: Colors.blueGrey.withOpacity(0.3),
              height: 1,
              width: _screen.width * 0.95,
            ),
            Container(
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
                    '12 likes',
                    style: _ts.copyWith(color: Colors.blueGrey.shade600),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.blueGrey.shade700,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    '4 comments',
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
                    'share',
                    style: _ts.copyWith(color: Colors.blueGrey.shade600),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
