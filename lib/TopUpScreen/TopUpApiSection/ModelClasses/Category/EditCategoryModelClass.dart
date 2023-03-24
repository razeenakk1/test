import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully edited ProductCategoty"
/// CategoryID : 3

EditCategoryModelClass editCategoryModelClassFromJson(String str) => EditCategoryModelClass.fromJson(json.decode(str));
String editCategoryModelClassToJson(EditCategoryModelClass data) => json.encode(data.toJson());
class EditCategoryModelClass {
  EditCategoryModelClass({
      num? statusCode, 
      String? message, 
      num? categoryID,}){
    _statusCode = statusCode;
    _message = message;
    _categoryID = categoryID;
}

  EditCategoryModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _categoryID = json['CategoryID'];
  }
  num? _statusCode;
  String? _message;
  num? _categoryID;
EditCategoryModelClass copyWith({  num? statusCode,
  String? message,
  num? categoryID,
}) => EditCategoryModelClass(  statusCode: statusCode ?? _statusCode,
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