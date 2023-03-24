import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created Area"
/// AreaID : 1

CreateAreaModelClass createAreaModelClassFromJson(String str) => CreateAreaModelClass.fromJson(json.decode(str));
String createAreaModelClassToJson(CreateAreaModelClass data) => json.encode(data.toJson());
class CreateAreaModelClass {
  CreateAreaModelClass({
      num? statusCode, 
      String? message, 
      num? areaID,}){
    _statusCode = statusCode;
    _message = message;
    _areaID = areaID;
}

  CreateAreaModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _areaID = json['AreaID'];
  }
  num? _statusCode;
  String? _message;
  num? _areaID;
CreateAreaModelClass copyWith({  num? statusCode,
  String? message,
  num? areaID,
}) => CreateAreaModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  areaID: areaID ?? _areaID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get areaID => _areaID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['AreaID'] = _areaID;
    return map;
  }

}