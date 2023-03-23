import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited TaxType"
/// TaxTypeID : 6

TaxEditModelClass taxEditModelClassFromJson(String str) => TaxEditModelClass.fromJson(json.decode(str));
String taxEditModelClassToJson(TaxEditModelClass data) => json.encode(data.toJson());
class TaxEditModelClass {
  TaxEditModelClass({
      num? statusCode, 
      String? message, 
      num? taxTypeID,}){
    _statusCode = statusCode;
    _message = message;
    _taxTypeID = taxTypeID;
}

  TaxEditModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _taxTypeID = json['TaxTypeID'];
  }
  num? _statusCode;
  String? _message;
  num? _taxTypeID;
TaxEditModelClass copyWith({  num? statusCode,
  String? message,
  num? taxTypeID,
}) => TaxEditModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  taxTypeID: taxTypeID ?? _taxTypeID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get taxTypeID => _taxTypeID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['TaxTypeID'] = _taxTypeID;
    return map;
  }

}