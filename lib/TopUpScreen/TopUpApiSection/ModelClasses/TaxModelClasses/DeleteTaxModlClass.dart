import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted TaxType"
/// TaxTypeName : "GSTIN"

DeleteTaxModlClass deleteTaxModlClassFromJson(String str) => DeleteTaxModlClass.fromJson(json.decode(str));
String deleteTaxModlClassToJson(DeleteTaxModlClass data) => json.encode(data.toJson());
class DeleteTaxModlClass {
  DeleteTaxModlClass({
      num? statusCode, 
      String? message, 
      String? taxTypeName,}){
    _statusCode = statusCode;
    _message = message;
    _taxTypeName = taxTypeName;
}

  DeleteTaxModlClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _taxTypeName = json['TaxTypeName'];
  }
  num? _statusCode;
  String? _message;
  String? _taxTypeName;
DeleteTaxModlClass copyWith({  num? statusCode,
  String? message,
  String? taxTypeName,
}) => DeleteTaxModlClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  taxTypeName: taxTypeName ?? _taxTypeName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get taxTypeName => _taxTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['TaxTypeName'] = _taxTypeName;
    return map;
  }

}