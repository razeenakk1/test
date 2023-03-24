import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created ProductGrop"
/// GroupID : 3

CreateGroupModelClass createGroupModelClassFromJson(String str) => CreateGroupModelClass.fromJson(json.decode(str));
String createGroupModelClassToJson(CreateGroupModelClass data) => json.encode(data.toJson());
class CreateGroupModelClass {
  CreateGroupModelClass({
      num? statusCode, 
      String? message, 
      num? groupID,}){
    _statusCode = statusCode;
    _message = message;
    _groupID = groupID;
}

  CreateGroupModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _groupID = json['GroupID'];
  }
  num? _statusCode;
  String? _message;
  num? _groupID;
CreateGroupModelClass copyWith({  num? statusCode,
  String? message,
  num? groupID,
}) => CreateGroupModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  groupID: groupID ?? _groupID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get groupID => _groupID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['GroupID'] = _groupID;
    return map;
  }

}