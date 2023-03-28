import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted User"
/// Username : "dfgfghjyh"

DeleteUserModelClass deleteUserModelClassFromJson(String str) => DeleteUserModelClass.fromJson(json.decode(str));
String deleteUserModelClassToJson(DeleteUserModelClass data) => json.encode(data.toJson());
class DeleteUserModelClass {
  DeleteUserModelClass({
      num? statusCode, 
      String? message, 
      String? username,}){
    _statusCode = statusCode;
    _message = message;
    _username = username;
}

  DeleteUserModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _username = json['Username'];
  }
  num? _statusCode;
  String? _message;
  String? _username;
DeleteUserModelClass copyWith({  num? statusCode,
  String? message,
  String? username,
}) => DeleteUserModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  username: username ?? _username,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['Username'] = _username;
    return map;
  }

}