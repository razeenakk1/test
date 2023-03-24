import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited ProductGroup"
/// GroupID : 3

EditGroupModelClass editGroupModelClassFromJson(String str) => EditGroupModelClass.fromJson(json.decode(str));
String editGroupModelClassToJson(EditGroupModelClass data) => json.encode(data.toJson());
class EditGroupModelClass {
  EditGroupModelClass({
      num? statusCode, 
      String? message, 
      num? groupID,}){
    _statusCode = statusCode;
    _message = message;
    _groupID = groupID;
}

  EditGroupModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _groupID = json['GroupID'];
  }
  num? _statusCode;
  String? _message;
  num? _groupID;
EditGroupModelClass copyWith({  num? statusCode,
  String? message,
  num? groupID,
}) => EditGroupModelClass(  statusCode: statusCode ?? _statusCode,
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