import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully deleted ProductCategoty"
/// CategoryName : "adult "

DeleteCategorModelClass deleteCategorModelClassFromJson(String str) => DeleteCategorModelClass.fromJson(json.decode(str));
String deleteCategorModelClassToJson(DeleteCategorModelClass data) => json.encode(data.toJson());
class DeleteCategorModelClass {
  DeleteCategorModelClass({
      num? statusCode, 
      String? message, 
      String? categoryName,}){
    _statusCode = statusCode;
    _message = message;
    _categoryName = categoryName;
}

  DeleteCategorModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _categoryName = json['CategoryName'];
  }
  num? _statusCode;
  String? _message;
  String? _categoryName;
DeleteCategorModelClass copyWith({  num? statusCode,
  String? message,
  String? categoryName,
}) => DeleteCategorModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  categoryName: categoryName ?? _categoryName,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['CategoryName'] = _categoryName;
    return map;
  }

}