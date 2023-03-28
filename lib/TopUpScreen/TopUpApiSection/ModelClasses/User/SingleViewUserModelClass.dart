import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed ProductCategoty"
/// data : {"id":57,"username":"rabeeyyyyyyyyh","first_name":"muhammmmmed","email":"rabeyyyyyyyyyyyye@vikncodes.com","Phone":9876543210,"IsAdmin":false,"UserRoles":"baf6a0b7-acc1-400b-8e06-63704c3bf819","Photo":null,"UserRoleName":"staff","Password":"123456"}

SingleViewUserModelClass singleViewUserModelClassFromJson(String str) => SingleViewUserModelClass.fromJson(json.decode(str));
String singleViewUserModelClassToJson(SingleViewUserModelClass data) => json.encode(data.toJson());
class SingleViewUserModelClass {
  SingleViewUserModelClass({
      num? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewUserModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  Data? _data;
SingleViewUserModelClass copyWith({  num? statusCode,
  String? message,
  Data? data,
}) => SingleViewUserModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 57
/// username : "rabeeyyyyyyyyh"
/// first_name : "muhammmmmed"
/// email : "rabeyyyyyyyyyyyye@vikncodes.com"
/// Phone : 9876543210
/// IsAdmin : false
/// UserRoles : "baf6a0b7-acc1-400b-8e06-63704c3bf819"
/// Photo : null
/// UserRoleName : "staff"
/// Password : "123456"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? username, 
      String? firstName, 
      String? email, 
      num? phone, 
      bool? isAdmin, 
      String? userRoles, 
      dynamic photo, 
      String? userRoleName, 
      String? password,}){
    _id = id;
    _username = username;
    _firstName = firstName;
    _email = email;
    _phone = phone;
    _isAdmin = isAdmin;
    _userRoles = userRoles;
    _photo = photo;
    _userRoleName = userRoleName;
    _password = password;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _email = json['email'];
    _phone = json['Phone'];
    _isAdmin = json['IsAdmin'];
    _userRoles = json['UserRoles'];
    _photo = json['Photo'];
    _userRoleName = json['UserRoleName'];
    _password = json['Password'];
  }
  num? _id;
  String? _username;
  String? _firstName;
  String? _email;
  num? _phone;
  bool? _isAdmin;
  String? _userRoles;
  dynamic _photo;
  String? _userRoleName;
  String? _password;
Data copyWith({  num? id,
  String? username,
  String? firstName,
  String? email,
  num? phone,
  bool? isAdmin,
  String? userRoles,
  dynamic photo,
  String? userRoleName,
  String? password,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  firstName: firstName ?? _firstName,
  email: email ?? _email,
  phone: phone ?? _phone,
  isAdmin: isAdmin ?? _isAdmin,
  userRoles: userRoles ?? _userRoles,
  photo: photo ?? _photo,
  userRoleName: userRoleName ?? _userRoleName,
  password: password ?? _password,
);
  num? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get email => _email;
  num? get phone => _phone;
  bool? get isAdmin => _isAdmin;
  String? get userRoles => _userRoles;
  dynamic get photo => _photo;
  String? get userRoleName => _userRoleName;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['first_name'] = _firstName;
    map['email'] = _email;
    map['Phone'] = _phone;
    map['IsAdmin'] = _isAdmin;
    map['UserRoles'] = _userRoles;
    map['Photo'] = _photo;
    map['UserRoleName'] = _userRoleName;
    map['Password'] = _password;
    return map;
  }

}