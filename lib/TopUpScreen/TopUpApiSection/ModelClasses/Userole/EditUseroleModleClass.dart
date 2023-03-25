import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited UserRoles"
/// UserRoleID : 4

EditUseroleModleClass editUseroleModleClassFromJson(String str) => EditUseroleModleClass.fromJson(json.decode(str));
String editUseroleModleClassToJson(EditUseroleModleClass data) => json.encode(data.toJson());
class EditUseroleModleClass {
  EditUseroleModleClass({
      num? statusCode, 
      String? message, 
      num? userRoleID,}){
    _statusCode = statusCode;
    _message = message;
    _userRoleID = userRoleID;
}

  EditUseroleModleClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _userRoleID = json['UserRoleID'];
  }
  num? _statusCode;
  String? _message;
  num? _userRoleID;
EditUseroleModleClass copyWith({  num? statusCode,
  String? message,
  num? userRoleID,
}) => EditUseroleModleClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  userRoleID: userRoleID ?? _userRoleID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get userRoleID => _userRoleID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['UserRoleID'] = _userRoleID;
    return map;
  }

}