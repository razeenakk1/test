import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created ProductCategory"
/// CategoryID : 2

CreateCategoryModlClass createCategoryModlClassFromJson(String str) => CreateCategoryModlClass.fromJson(json.decode(str));
String createCategoryModlClassToJson(CreateCategoryModlClass data) => json.encode(data.toJson());
class CreateCategoryModlClass {
  CreateCategoryModlClass({
      num? statusCode, 
      String? message, 
      num? categoryID,}){
    _statusCode = statusCode;
    _message = message;
    _categoryID = categoryID;
}

  CreateCategoryModlClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _categoryID = json['CategoryID'];
  }
  num? _statusCode;
  String? _message;
  num? _categoryID;
CreateCategoryModlClass copyWith({  num? statusCode,
  String? message,
  num? categoryID,
}) => CreateCategoryModlClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  categoryID: categoryID ?? _categoryID,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  num? get categoryID => _categoryID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['CategoryID'] = _categoryID;
    return map;
  }

}