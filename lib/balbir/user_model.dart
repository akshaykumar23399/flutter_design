

class User {
  String _message;
  String _token;

  User({String message, String token}) {
    this._message = message;
    this._token = token;
  }

  String get message => _message;
  set message(String message) => _message = message;
  String get token => _token;
  set token(String token) => _token = token;

  User.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['token'] = this._token;
    return data;
  }
}

