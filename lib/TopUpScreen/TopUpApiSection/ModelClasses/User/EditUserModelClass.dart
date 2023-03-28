import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited User"
/// User_id : 2

EditUserModelClass editUserModelClassFromJson(String str) => EditUserModelClass.fromJson(json.decode(str));
String editUserModelClassToJson(EditUserModelClass data) => json.encode(data.toJson());
class EditUserModelClass {
  EditUserModelClass({
      num? statusCode, 
      String? message, 
      num? userId,}){
    _statusCode = statusCode;
    _message = message;
    _userId = userId;
}

  EditUserModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _userId = json['User_id'];
  }
  num? _statusCode;
  String? _message;
  num? _userId;
EditUserModelClass copyWith({  num? statusCode,
  String? message,
  num? userId,
}) => EditUserModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  userId: userId ?? _userId,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['User_id'] = _userId;
    return map;
  }

}