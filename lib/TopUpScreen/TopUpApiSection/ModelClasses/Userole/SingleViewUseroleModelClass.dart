import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed ProductCategoty"
/// data : [{"id":"2782a181-4077-4444-a069-b613d743ab43","UserRoleID":1,"UserRoleName":"staff","Sale":true,"Purchase":false,"StockUpdate":false,"Reports":true}]

SingleViewUseroleModelClass singleViewUseroleModelClassFromJson(String str) => SingleViewUseroleModelClass.fromJson(json.decode(str));
String singleViewUseroleModelClassToJson(SingleViewUseroleModelClass data) => json.encode(data.toJson());
class SingleViewUseroleModelClass {
  SingleViewUseroleModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewUseroleModelClass.fromJson(dynamic json) {
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
SingleViewUseroleModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => SingleViewUseroleModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "2782a181-4077-4444-a069-b613d743ab43"
/// UserRoleID : 1
/// UserRoleName : "staff"
/// Sale : true
/// Purchase : false
/// StockUpdate : false
/// Reports : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? userRoleID, 
      String? userRoleName, 
      bool? sale, 
      bool? purchase, 
      bool? stockUpdate, 
      bool? reports,}){
    _id = id;
    _userRoleID = userRoleID;
    _userRoleName = userRoleName;
    _sale = sale;
    _purchase = purchase;
    _stockUpdate = stockUpdate;
    _reports = reports;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userRoleID = json['UserRoleID'];
    _userRoleName = json['UserRoleName'];
    _sale = json['Sale'];
    _purchase = json['Purchase'];
    _stockUpdate = json['StockUpdate'];
    _reports = json['Reports'];
  }
  String? _id;
  num? _userRoleID;
  String? _userRoleName;
  bool? _sale;
  bool? _purchase;
  bool? _stockUpdate;
  bool? _reports;
Data copyWith({  String? id,
  num? userRoleID,
  String? userRoleName,
  bool? sale,
  bool? purchase,
  bool? stockUpdate,
  bool? reports,
}) => Data(  id: id ?? _id,
  userRoleID: userRoleID ?? _userRoleID,
  userRoleName: userRoleName ?? _userRoleName,
  sale: sale ?? _sale,
  purchase: purchase ?? _purchase,
  stockUpdate: stockUpdate ?? _stockUpdate,
  reports: reports ?? _reports,
);
  String? get id => _id;
  num? get userRoleID => _userRoleID;
  String? get userRoleName => _userRoleName;
  bool? get sale => _sale;
  bool? get purchase => _purchase;
  bool? get stockUpdate => _stockUpdate;
  bool? get reports => _reports;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['UserRoleID'] = _userRoleID;
    map['UserRoleName'] = _userRoleName;
    map['Sale'] = _sale;
    map['Purchase'] = _purchase;
    map['StockUpdate'] = _stockUpdate;
    map['Reports'] = _reports;
    return map;
  }

}