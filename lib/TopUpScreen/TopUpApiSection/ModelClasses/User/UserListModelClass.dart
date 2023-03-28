import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Users"
/// data : [{"id":57,"username":"rabeeyyyyyyyyh","first_name":"muhammmmmed","email":"rabeyyyyyyyyyyyye@vikncodes.com","password":"123456"},{"id":1,"username":"topup","first_name":"","email":"","password":null}]

UserListModelClass userListModelClassFromJson(String str) => UserListModelClass.fromJson(json.decode(str));
String userListModelClassToJson(UserListModelClass data) => json.encode(data.toJson());
class UserListModelClass {
  UserListModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  UserListModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _statusCode;
  String? _message;
  List<Data>? _data;
UserListModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => UserListModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 57
/// username : "rabeeyyyyyyyyh"
/// first_name : "muhammmmmed"
/// email : "rabeyyyyyyyyyyyye@vikncodes.com"
/// password : "123456"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? username, 
      String? firstName, 
      String? email, 
      String? password,}){
    _id = id;
    _username = username;
    _firstName = firstName;
    _email = email;
    _password = password;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _email = json['email'];
    _password = json['password'];
  }
  num? _id;
  String? _username;
  String? _firstName;
  String? _email;
  String? _password;
Data copyWith({  num? id,
  String? username,
  String? firstName,
  String? email,
  String? password,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  firstName: firstName ?? _firstName,
  email: email ?? _email,
  password: password ?? _password,
);
  num? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['first_name'] = _firstName;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}