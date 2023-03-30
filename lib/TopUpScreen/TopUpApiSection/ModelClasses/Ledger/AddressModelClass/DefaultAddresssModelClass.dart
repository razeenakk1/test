import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully updated default Address"

DefaultAddresssModelClass defaultAddresssModelClassFromJson(String str) => DefaultAddresssModelClass.fromJson(json.decode(str));
String defaultAddresssModelClassToJson(DefaultAddresssModelClass data) => json.encode(data.toJson());
class DefaultAddresssModelClass {
  DefaultAddresssModelClass({
      int? statusCode, 
      String? message,}){
    _statusCode = statusCode;
    _message = message;
}

  DefaultAddresssModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
  }
  int? _statusCode;
  String? _message;
DefaultAddresssModelClass copyWith({  int? statusCode,
  String? message,
}) => DefaultAddresssModelClass(  statusCode: statusCode ?? _statusCode,
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