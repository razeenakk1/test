import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted Ledger"
/// LedgerName : "VAT on service Sales"

DeleteLedgerModelClass deleteLedgerModelClassFromJson(String str) => DeleteLedgerModelClass.fromJson(json.decode(str));
String deleteLedgerModelClassToJson(DeleteLedgerModelClass data) => json.encode(data.toJson());
class DeleteLedgerModelClass {
  DeleteLedgerModelClass({
      num? statusCode, 
      String? message, 
      String? ledgerName,}){
    _statusCode = statusCode;
    _message = message;
    _ledgerName = ledgerName;
}

  DeleteLedgerModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _ledgerName = json['LedgerName'];
  }
  num? _statusCode;
  String? _message;
  String? _ledgerName;
DeleteLedgerModelClass copyWith({  num? statusCode,
  String? message,
  String? ledgerName,
}) => DeleteLedgerModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  ledgerName: ledgerName ?? _ledgerName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get ledgerName => _ledgerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['LedgerName'] = _ledgerName;
    return map;
  }

}