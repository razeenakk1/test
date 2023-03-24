import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed ProductGroup"
/// data : [{"id":"c2565af2-d4b2-4f29-a4c9-6b6712e77c00","GroupID":1,"ProductGroupName":"Primary Group"}]

SingleViewGroupModelClass singleViewGroupModelClassFromJson(String str) => SingleViewGroupModelClass.fromJson(json.decode(str));
String singleViewGroupModelClassToJson(SingleViewGroupModelClass data) => json.encode(data.toJson());
class SingleViewGroupModelClass {
  SingleViewGroupModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewGroupModelClass.fromJson(dynamic json) {
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
SingleViewGroupModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => SingleViewGroupModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "c2565af2-d4b2-4f29-a4c9-6b6712e77c00"
/// GroupID : 1
/// ProductGroupName : "Primary Group"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? groupID, 
      String? productGroupName,}){
    _id = id;
    _groupID = groupID;
    _productGroupName = productGroupName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _groupID = json['GroupID'];
    _productGroupName = json['ProductGroupName'];
  }
  String? _id;
  num? _groupID;
  String? _productGroupName;
Data copyWith({  String? id,
  num? groupID,
  String? productGroupName,
}) => Data(  id: id ?? _id,
  groupID: groupID ?? _groupID,
  productGroupName: productGroupName ?? _productGroupName,
);
  String? get id => _id;
  num? get groupID => _groupID;
  String? get productGroupName => _productGroupName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['GroupID'] = _groupID;
    map['ProductGroupName'] = _productGroupName;
    return map;
  }

}