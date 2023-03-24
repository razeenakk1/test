import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed ProductCategoty"
/// data : [{"id":"969e9325-ccb3-493b-83b2-d224f97c084b","CategoryID":3,"CategoryName":"h"}]

SingleViewCategoryModelClass singleViewCategoryModelClassFromJson(String str) => SingleViewCategoryModelClass.fromJson(json.decode(str));
String singleViewCategoryModelClassToJson(SingleViewCategoryModelClass data) => json.encode(data.toJson());
class SingleViewCategoryModelClass {
  SingleViewCategoryModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewCategoryModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _statusCode;
  String? _message;
  List<Data>? _data;
SingleViewCategoryModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => SingleViewCategoryModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "969e9325-ccb3-493b-83b2-d224f97c084b"
/// CategoryID : 3
/// CategoryName : "h"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? categoryID, 
      String? categoryName,}){
    _id = id;
    _categoryID = categoryID;
    _categoryName = categoryName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryID = json['CategoryID'];
    _categoryName = json['CategoryName'];
  }
  String? _id;
  num? _categoryID;
  String? _categoryName;
Data copyWith({  String? id,
  num? categoryID,
  String? categoryName,
}) => Data(  id: id ?? _id,
  categoryID: categoryID ?? _categoryID,
  categoryName: categoryName ?? _categoryName,
);
  String? get id => _id;
  num? get categoryID => _categoryID;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['CategoryID'] = _categoryID;
    map['CategoryName'] = _categoryName;
    return map;
  }

}