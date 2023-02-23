import 'dart:convert';
/// StatusCode : 6000
/// data : {"BrandID":2,"BranchID":1,"BrandName":"test compa llp","Notes":"hi"}

BrandCreateModelClass brandCreateModelClassFromJson(String str) => BrandCreateModelClass.fromJson(json.decode(str));
String brandCreateModelClassToJson(BrandCreateModelClass data) => json.encode(data.toJson());
class BrandCreateModelClass {
  BrandCreateModelClass({
      num? statusCode, 
      Data? data,}){
    _statusCode = statusCode;
    _data = data;
}

  BrandCreateModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  Data? _data;
BrandCreateModelClass copyWith({  num? statusCode,
  Data? data,
}) => BrandCreateModelClass(  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// BrandID : 2
/// BranchID : 1
/// BrandName : "test compa llp"
/// Notes : "hi"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? brandID, 
      num? branchID, 
      String? brandName, 
      String? notes,}){
    _brandID = brandID;
    _branchID = branchID;
    _brandName = brandName;
    _notes = notes;
}

  Data.fromJson(dynamic json) {
    _brandID = json['BrandID'];
    _branchID = json['BranchID'];
    _brandName = json['BrandName'];
    _notes = json['Notes'];
  }
  num? _brandID;
  num? _branchID;
  String? _brandName;
  String? _notes;
Data copyWith({  num? brandID,
  num? branchID,
  String? brandName,
  String? notes,
}) => Data(  brandID: brandID ?? _brandID,
  branchID: branchID ?? _branchID,
  brandName: brandName ?? _brandName,
  notes: notes ?? _notes,
);
  num? get brandID => _brandID;
  num? get branchID => _branchID;
  String? get brandName => _brandName;
  String? get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BrandID'] = _brandID;
    map['BranchID'] = _branchID;
    map['BrandName'] = _brandName;
    map['Notes'] = _notes;
    return map;
  }

}