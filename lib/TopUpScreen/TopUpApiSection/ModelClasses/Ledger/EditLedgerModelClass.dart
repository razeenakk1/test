import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited Ledger"
/// LedgerID : 95

EditLedgerModelClass editLedgerModelClassFromJson(String str) => EditLedgerModelClass.fromJson(json.decode(str));
String editLedgerModelClassToJson(EditLedgerModelClass data) => json.encode(data.toJson());
class EditLedgerModelClass {
  EditLedgerModelClass({
      int? statusCode, 
      String? message, 
      int? ledgerID,}){
    _statusCode = statusCode;
    _message = message;
    _ledgerID = ledgerID;
}

  EditLedgerModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _ledgerID = json['LedgerID'];
  }
  int? _statusCode;
  String? _message;
  int? _ledgerID;
EditLedgerModelClass copyWith({  int? statusCode,
  String? message,
  int? ledgerID,
}) => EditLedgerModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  ledgerID: ledgerID ?? _ledgerID,
);
  int? get statusCode => _statusCode;
  String? get message => _message;
  int? get ledgerID => _ledgerID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['LedgerID'] = _ledgerID;
    return map;
  }

}