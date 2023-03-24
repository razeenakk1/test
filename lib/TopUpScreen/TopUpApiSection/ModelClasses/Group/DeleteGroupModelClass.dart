import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted ProductGroup"
/// ProductGroupName : "High Level"

DeleteGroupModelClass deleteGroupModelClassFromJson(String str) => DeleteGroupModelClass.fromJson(json.decode(str));
String deleteGroupModelClassToJson(DeleteGroupModelClass data) => json.encode(data.toJson());
class DeleteGroupModelClass {
  DeleteGroupModelClass({
      num? statusCode, 
      String? message, 
      String? productGroupName,}){
    _statusCode = statusCode;
    _message = message;
    _productGroupName = productGroupName;
}

  DeleteGroupModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _productGroupName = json['ProductGroupName'];
  }
  num? _statusCode;
  String? _message;
  String? _productGroupName;
DeleteGroupModelClass copyWith({  num? statusCode,
  String? message,
  String? productGroupName,
}) => DeleteGroupModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  productGroupName: productGroupName ?? _productGroupName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get productGroupName => _productGroupName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['ProductGroupName'] = _productGroupName;
    return map;
  }

}