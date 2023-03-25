import 'dart:convert';
/// StatusCode : 6000
/// message : "A user with that username already exists."
/// data : {"first_name":"murgghggham","username":"dfghhfrghjyh","email":"rarjmhhkbee@viknces.com","password1":"123456","password2":"123456","phone":"9876543210"}
/// userID : 38

CreateUserModelClass createUserModelClassFromJson(String str) => CreateUserModelClass.fromJson(json.decode(str));
String createUserModelClassToJson(CreateUserModelClass data) => json.encode(data.toJson());
class CreateUserModelClass {
  CreateUserModelClass({
      num? statusCode, 
      String? message, 
      Data? data, 
      num? userID,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
    _userID = userID;
}

  CreateUserModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _userID = json['userID'];
  }
  num? _statusCode;
  String? _message;
  Data? _data;
  num? _userID;
CreateUserModelClass copyWith({  num? statusCode,
  String? message,
  Data? data,
  num? userID,
}) => CreateUserModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
  userID: userID ?? _userID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;
  num? get userID => _userID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['userID'] = _userID;
    return map;
  }

}

/// first_name : "murgghggham"
/// username : "dfghhfrghjyh"
/// email : "rarjmhhkbee@viknces.com"
/// password1 : "123456"
/// password2 : "123456"
/// phone : "9876543210"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? firstName, 
      String? username, 
      String? email, 
      String? password1, 
      String? password2, 
      String? phone,}){
    _firstName = firstName;
    _username = username;
    _email = email;
    _password1 = password1;
    _password2 = password2;
    _phone = phone;
}

  Data.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _username = json['username'];
    _email = json['email'];
    _password1 = json['password1'];
    _password2 = json['password2'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _username;
  String? _email;
  String? _password1;
  String? _password2;
  String? _phone;
Data copyWith({  String? firstName,
  String? username,
  String? email,
  String? password1,
  String? password2,
  String? phone,
}) => Data(  firstName: firstName ?? _firstName,
  username: username ?? _username,
  email: email ?? _email,
  password1: password1 ?? _password1,
  password2: password2 ?? _password2,
  phone: phone ?? _phone,
);
  String? get firstName => _firstName;
  String? get username => _username;
  String? get email => _email;
  String? get password1 => _password1;
  String? get password2 => _password2;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['username'] = _username;
    map['email'] = _email;
    map['password1'] = _password1;
    map['password2'] = _password2;
    map['phone'] = _phone;
    return map;
  }

}