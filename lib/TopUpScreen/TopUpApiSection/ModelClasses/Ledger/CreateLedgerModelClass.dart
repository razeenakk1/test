import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created Ledger"
/// LedgerID : 93

CreateLedgerModelClass createLedgerModelClassFromJson(String str) => CreateLedgerModelClass.fromJson(json.decode(str));
String createLedgerModelClassToJson(CreateLedgerModelClass data) => json.encode(data.toJson());
class CreateLedgerModelClass {
  CreateLedgerModelClass({
      num? statusCode, 
      String? message, 
      num? ledgerID,}){
    _statusCode = statusCode;
    _message = message;
    _ledgerID = ledgerID;
}

  CreateLedgerModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _ledgerID = json['LedgerID'];
  }
  num? _statusCode;
  String? _message;
  num? _ledgerID;
CreateLedgerModelClass copyWith({  num? statusCode,
  String? message,
  num? ledgerID,
}) => CreateLedgerModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  ledgerID: ledgerID ?? _ledgerID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get ledgerID => _ledgerID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['LedgerID'] = _ledgerID;
    return map;
  }

}