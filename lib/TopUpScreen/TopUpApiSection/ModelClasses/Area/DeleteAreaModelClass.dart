import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted TaxType"
/// AreaName : "Qatar "

DeleteAreaModelClass deleteAreaModelClassFromJson(String str) => DeleteAreaModelClass.fromJson(json.decode(str));
String deleteAreaModelClassToJson(DeleteAreaModelClass data) => json.encode(data.toJson());
class DeleteAreaModelClass {
  DeleteAreaModelClass({
      num? statusCode, 
      String? message, 
      String? areaName,}){
    _statusCode = statusCode;
    _message = message;
    _areaName = areaName;
}

  DeleteAreaModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _areaName = json['AreaName'];
  }
  num? _statusCode;
  String? _message;
  String? _areaName;
DeleteAreaModelClass copyWith({  num? statusCode,
  String? message,
  String? areaName,
}) => DeleteAreaModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  areaName: areaName ?? _areaName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get areaName => _areaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['AreaName'] = _areaName;
    return map;
  }

}