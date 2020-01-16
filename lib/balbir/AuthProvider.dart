import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ap/balbir/user_model.dart';
import 'package:http/http.dart';

enum Status { Unauthenticated, Authenticated }

class AuthProvider with ChangeNotifier {
  User user;
  Status _status = Status.Unauthenticated;

  AuthProvider();

  Status get status => _status;

  @protected
  set status(Status value) => _status = value;

  void signIn(String email, String password) async {

    String url = 'https://mmstq.herokuapp.com/user/login';
    String body = '{"email": "$email", "password": "$password"}';
    Map<String, String> headers = {"Content-type": "application/json"};

    try {
      Response response = await post(url, headers: headers, body: body);

      user = User.fromJson(json.decode(response.body));

      int statusCode = response.statusCode;

      debugPrint('status: $statusCode');
      debugPrint('status: ${user.token}');

      if (statusCode == 200) {
        status = Status.Authenticated;
        notifyListeners();
      } else {
        status = Status.Unauthenticated;
        notifyListeners();
      }
    } catch (error) {
      debugPrint(error.toString());
      status = Status.Unauthenticated;
      notifyListeners();
    }
  }
}
