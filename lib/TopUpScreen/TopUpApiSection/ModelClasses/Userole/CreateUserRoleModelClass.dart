import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created UserRole"
/// UserRoleID : 1
/// id : "2782a181-4077-4444-a069-b613d743ab43"

CreateUserRoleModelClass createUserRoleModelClassFromJson(String str) => CreateUserRoleModelClass.fromJson(json.decode(str));
String createUserRoleModelClassToJson(CreateUserRoleModelClass data) => json.encode(data.toJson());
class CreateUserRoleModelClass {
  CreateUserRoleModelClass({
      num? statusCode, 
      String? message, 
      num? userRoleID, 
      String? id,}){
    _statusCode = statusCode;
    _message = message;
    _userRoleID = userRoleID;
    _id = id;
}

  CreateUserRoleModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _userRoleID = json['UserRoleID'];
    _id = json['id'];
  }
  num? _statusCode;
  String? _message;
  num? _userRoleID;
  String? _id;
CreateUserRoleModelClass copyWith({  num? statusCode,
  String? message,
  num? userRoleID,
  String? id,
}) => CreateUserRoleModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  userRoleID: userRoleID ?? _userRoleID,
  id: id ?? _id,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get userRoleID => _userRoleID;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['UserRoleID'] = _userRoleID;
    map['id'] = _id;
    return map;
  }

}