import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created TaxType"
/// TaxTypeID : 5

CreateTaxModelClass createTaxModelClassFromJson(String str) => CreateTaxModelClass.fromJson(json.decode(str));
String createTaxModelClassToJson(CreateTaxModelClass data) => json.encode(data.toJson());
class CreateTaxModelClass {
  CreateTaxModelClass({
      num? statusCode, 
      String? message, 
      num? taxTypeID,}){
    _statusCode = statusCode;
    _message = message;
    _taxTypeID = taxTypeID;
}

  CreateTaxModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _taxTypeID = json['TaxTypeID'];
  }
  num? _statusCode;
  String? _message;
  num? _taxTypeID;
CreateTaxModelClass copyWith({  num? statusCode,
  String? message,
  num? taxTypeID,
}) => CreateTaxModelClass(  statusCode: statusCode ?? _statusCode,
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