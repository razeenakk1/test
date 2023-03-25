import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Users"
/// data : [{"id":3,"username":"testsample","first_name":"test","email":"test@vikncodes.com"},{"id":1,"username":"topup","first_name":"","email":""},{"id":4,"username":"rabeeh","first_name":"muhammed","email":"rabee@vikncodes.com"}]

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

/// id : 3
/// username : "testsample"
/// first_name : "test"
/// email : "test@vikncodes.com"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? username, 
      String? firstName, 
      String? email,}){
    _id = id;
    _username = username;
    _firstName = firstName;
    _email = email;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _email = json['email'];
  }
  num? _id;
  String? _username;
  String? _firstName;
  String? _email;
Data copyWith({  num? id,
  String? username,
  String? firstName,
  String? email,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  firstName: firstName ?? _firstName,
  email: email ?? _email,
);
  num? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['first_name'] = _firstName;
    map['email'] = _email;
    return map;
  }

}