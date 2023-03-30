import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited Address"

EditAddressModelClass editAddressModelClassFromJson(String str) => EditAddressModelClass.fromJson(json.decode(str));
String editAddressModelClassToJson(EditAddressModelClass data) => json.encode(data.toJson());
class EditAddressModelClass {
  EditAddressModelClass({
      int? statusCode, 
      String? message,}){
    _statusCode = statusCode;
    _message = message;
}

  EditAddressModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
  }
  int? _statusCode;
  String? _message;
EditAddressModelClass copyWith({  int? statusCode,
  String? message,
}) => EditAddressModelClass(  statusCode: statusCode ?? _statusCode,
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