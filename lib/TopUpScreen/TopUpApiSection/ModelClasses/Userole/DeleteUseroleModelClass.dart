import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted UserRole"
/// UserRoleName : "staff"

DeleteUseroleModelClass deleteUseroleModelClassFromJson(String str) => DeleteUseroleModelClass.fromJson(json.decode(str));
String deleteUseroleModelClassToJson(DeleteUseroleModelClass data) => json.encode(data.toJson());
class DeleteUseroleModelClass {
  DeleteUseroleModelClass({
      num? statusCode, 
      String? message, 
      String? userRoleName,}){
    _statusCode = statusCode;
    _message = message;
    _userRoleName = userRoleName;
}

  DeleteUseroleModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _userRoleName = json['UserRoleName'];
  }
  num? _statusCode;
  String? _message;
  String? _userRoleName;
DeleteUseroleModelClass copyWith({  num? statusCode,
  String? message,
  String? userRoleName,
}) => DeleteUseroleModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  userRoleName: userRoleName ?? _userRoleName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get userRoleName => _userRoleName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['UserRoleName'] = _userRoleName;
    return map;
  }

}