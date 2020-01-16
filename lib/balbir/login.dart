import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/balbir/AuthProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;

  final _ts = TextStyle(fontFamily: 'Quicksand');
  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 60,
              width: 250,
              child: TextFormField(
                onChanged: (value){
                  debugPrint('email: $value');
                  email = value;
                  },
                keyboardType: TextInputType.emailAddress,
//                            textAlignVertical: TextAlignVertical.center,
                minLines: 2,
                maxLines: 4,
                style: _ts.copyWith(fontSize: 18),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey.shade700,
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'email'),
              )
            ),
            SizedBox(height: 20,),
            Container(
                height: 60,
                width: 250,
                child: TextFormField(
                  onChanged: (value){
                    debugPrint('password: $value');
                    password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  minLines: 2,
                  maxLines: 4,
                  style: _ts.copyWith(fontSize: 18),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey.shade700,
                              width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'password'),
                )
            ),
            SizedBox(height: 30,),
            RaisedButton(
              color: Colors.red,
              onPressed: (){
                _authProvider.signIn(email, password);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Text('Login', style: _ts.copyWith(fontSize: 20, color: Colors.white),),
            )

          ],
        ),
      ),
    );
  }
}
