import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted Address"

DeleteAddressModelClass deleteAddressModelClassFromJson(String str) => DeleteAddressModelClass.fromJson(json.decode(str));
String deleteAddressModelClassToJson(DeleteAddressModelClass data) => json.encode(data.toJson());
class DeleteAddressModelClass {
  DeleteAddressModelClass({
      int? statusCode, 
      String? message,}){
    _statusCode = statusCode;
    _message = message;
}

  DeleteAddressModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
  }
  int? _statusCode;
  String? _message;
DeleteAddressModelClass copyWith({  int? statusCode,
  String? message,
}) => DeleteAddressModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
);
  int? get statusCode => _statusCode;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    return map;
  }

}