import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _postContentController =
      new TextEditingController();

  final _ts = TextStyle(fontFamily: 'Quicksand');
  bool _isPublic = true;

  final listOfCategories = <String>[
    'you',
    'like',
    'football',
    'vishal',
    'mushtak',
    'laptop'
  ];



  List<String> selectedCategories =[];

  final profileURL = 'https://encrypted-tbn0.gstatic.com/'
      'images?q=tbn:ANd9GcRPyKlEV86yRzGsebr'
      '3AsVOq88NoMknLrYDrb5vKITcDcIXd_my&s';

  final String imageURL = 'https://'
      'images.pexels.com/photos/247599/'
      'pexels-photo-247599.jpeg?auto=compress&cs'
      '=tinysrgb&dpr=1&w=500';

  @override
  Widget build(BuildContext context) {

    List<String> list = ['banana', 'apple', 'orange'];
    list.sort((a, b)=>a.compareTo(b));
    debugPrint(list.toString());

    final _screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text('Your Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.arrow_forward),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  imageURL,
                  height: _screen.height * 0.3,
                  width: _screen.width,
                  fit: BoxFit.cover,
                ),
                
                Positioned(
                  left: 20,
                  top: 20,
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () {
                        final file = FilePicker.getFile();
                      },
                    ),
                    radius: 35,
                    backgroundImage: NetworkImage(
                        profileURL),
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
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        final file = FilePicker.getFile();
                      },
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'For help getting started with Flutter,'
                        ' view our online documentation, which offers tutorials',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: _ts.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 5,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade700,
                              borderRadius: BorderRadius.circular(1.5)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 73,
                          width: _screen.width * 0.8,
                          child: TextField(
//                            textAlignVertical: TextAlignVertical.center,
                            minLines: 3,
                            maxLines: 4,
                            controller: _postContentController,
                            style: _ts.copyWith(fontSize: 18),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueGrey.shade700,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Enter page name'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'For help getting started with Flutter,'
                        ' view our online documentation, which offers tutorials,',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: _ts.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 5,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade700,
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: _screen.width * 0.8,
                          child: ChipsInput(
                            initialValue: selectedCategories,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey.shade700,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              hintText: 'Enter or choose category',
                              hintStyle: _ts.copyWith(fontSize: 18),
                            ),
                            maxChips: 3,
                            findSuggestions: (String query) {
                              if (query.length != 0) {
                                var lowercaseQuery = query.toLowerCase();
                                return listOfCategories.where((name) {
                                  return name
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                                }).toList(growable: false)
                                  ..sort((a, b) => a
                                      .toLowerCase()
                                      .indexOf(lowercaseQuery)
                                      .compareTo(b
                                          .toLowerCase()
                                          .indexOf(lowercaseQuery)));
                              }
                              return listOfCategories;
                            },
                            onChanged: (data) {
                              selectedCategories = data;
                              print(selectedCategories);
                            },
                            chipBuilder: (context, state, name) {
                              return InputChip(
                                key: ObjectKey(name),
                                label: Text(name),
                                onDeleted: () => state.deleteChip(name),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              );
                            },
                            suggestionBuilder: (context, state, name) {
                              return ListTile(
                                key: ObjectKey(name),
                                title: Text(name),
                                onTap: () => state.selectSuggestion(name),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Public',
                                style: _ts.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() {
                                    _isPublic = value;
                                  });
                                },
                                value: _isPublic,
                              )
                            ],
                          ),
                          Text(
                            'For help getting started with Flutter,'
                            ' view our online documentation, which offers tutorials,',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: _ts.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Private',
                                style: _ts.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey.shade700),
                              ),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() {
                                    _isPublic = !value;
                                  });
                                },
                                value: !_isPublic,
                              )
                            ],
                          ),
                          Text(
                            'For help getting started with Flutter,'
                            ' view our online documentation, which offers tutorials,',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: _ts.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
