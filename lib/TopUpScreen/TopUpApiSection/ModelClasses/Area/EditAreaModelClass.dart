import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited TaxType"
/// AreaID : 7

EditAreaModelClass editAreaModelClassFromJson(String str) => EditAreaModelClass.fromJson(json.decode(str));
String editAreaModelClassToJson(EditAreaModelClass data) => json.encode(data.toJson());
class EditAreaModelClass {
  EditAreaModelClass({
      num? statusCode, 
      String? message, 
      num? areaID,}){
    _statusCode = statusCode;
    _message = message;
    _areaID = areaID;
}

  EditAreaModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _areaID = json['AreaID'];
  }
  num? _statusCode;
  String? _message;
  num? _areaID;
EditAreaModelClass copyWith({  num? statusCode,
  String? message,
  num? areaID,
}) => EditAreaModelClass(  statusCode: statusCode ?? _statusCode,
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