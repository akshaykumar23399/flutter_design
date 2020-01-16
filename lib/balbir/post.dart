import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final _ts = TextStyle(fontFamily: 'Quicksand');
  final List shareOptions = ['only me', 'only friends', 'everyone'];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in shareOptions) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  bool isBold = false;
  bool isItalic = false;
  final TextEditingController _postController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPyKlEV86yRzGsebr3AsVOq88NoMknLrYDrb5vKITcDcIXd_my&s'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Vishal Sharma',
                        style: _ts.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.blueGrey.shade700),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 2),
                        height: _screenSize.height * 0.035,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Colors.blueGrey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          style: _ts.copyWith(
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.w500),
                          underline: Container(),
                          isDense: false,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blueGrey.shade300,
                          ),
                          value: _currentCity,
                          items: _dropDownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _currentCity = value;
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: _screenSize.width * 0.95,
              child: TextField(
                minLines: 4,
                maxLines: 5,
                controller: _postController,
                style: _ts.copyWith(fontSize: 18),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey.shade700.withOpacity(0.3),
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "What's in your mind?",
                    hintStyle: _ts.copyWith(
                        color: Colors.blueGrey.shade700, fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Container(
                  height: 40,
                  width: 40,
                  decoration: isBold
                      ? BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.blueGrey.shade500, width: 1),
                    color: Colors.blueGrey.withOpacity(0.7),
                  )
                      : BoxDecoration(),
                  child: IconButton(
                    icon: Icon(
                      Icons.format_bold,
                      color: Colors.blueGrey.shade800,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        isBold = !isBold;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: isItalic
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: Colors.blueGrey.shade500, width: 1),
                          color: Colors.blueGrey.withOpacity(0.7),
                        )
                      : BoxDecoration(),
                  child: IconButton(
                    icon: Icon(
                      Icons.format_italic,
                      color: Colors.blueGrey.shade800,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        isItalic = !isItalic;
                      });
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 80,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(15, (index) => getColorList(index)).toList()),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Photo/Video',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Tag Friends',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_location,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Location',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.insert_emoticon,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Feeling/Activity',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.attachment,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Include File',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.videocam,
                          color: Colors.blueGrey.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Go Live',
                          style: _ts.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.blueGrey.shade700),
                        ),
                      ],
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){},
        child: Icon(Icons.send),
      ),
    );
  }

  Widget getColorList(int index) {
    final MaterialColor color = Colors.primaries[index];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: 70,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5))),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
