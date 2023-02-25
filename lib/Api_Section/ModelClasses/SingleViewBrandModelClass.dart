import 'dart:convert';
/// StatusCode : 6000
/// data : {"id":"e2d3d32a-3681-4c22-a300-9bfa819e9d46","name":"ihojoj","BrandID":9,"BranchID":1,"BrandName":"ihojoj","Notes":"khooj","CreatedUserID":332,"CreatedDate":"2023-02-24T10:39:40.646745","UpdatedDate":"2023-02-24T10:39:40.641373","Action":"A","IsDefault":false}

SingleViewBrandModelClass singleViewBrandModelClassFromJson(String str) => SingleViewBrandModelClass.fromJson(json.decode(str));
String singleViewBrandModelClassToJson(SingleViewBrandModelClass data) => json.encode(data.toJson());
class SingleViewBrandModelClass {
  SingleViewBrandModelClass({
      num? statusCode, 
      Data? data,}){
    _statusCode = statusCode;
    _data = data;
}

  SingleViewBrandModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  Data? _data;
SingleViewBrandModelClass copyWith({  num? statusCode,
  Data? data,
}) => SingleViewBrandModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "e2d3d32a-3681-4c22-a300-9bfa819e9d46"
/// name : "ihojoj"
/// BrandID : 9
/// BranchID : 1
/// BrandName : "ihojoj"
/// Notes : "khooj"
/// CreatedUserID : 332
/// CreatedDate : "2023-02-24T10:39:40.646745"
/// UpdatedDate : "2023-02-24T10:39:40.641373"
/// Action : "A"
/// IsDefault : false

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? name, 
      num? brandID, 
      num? branchID, 
      String? brandName, 
      String? notes, 
      num? createdUserID, 
      String? createdDate, 
      String? updatedDate, 
      String? action, 
      bool? isDefault,}){
    _id = id;
    _name = name;
    _brandID = brandID;
    _branchID = branchID;
    _brandName = brandName;
    _notes = notes;
    _createdUserID = createdUserID;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _action = action;
    _isDefault = isDefault;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _brandID = json['BrandID'];
    _branchID = json['BranchID'];
    _brandName = json['BrandName'];
    _notes = json['Notes'];
    _createdUserID = json['CreatedUserID'];
    _createdDate = json['CreatedDate'];
    _updatedDate = json['UpdatedDate'];
    _action = json['Action'];
    _isDefault = json['IsDefault'];
  }
  String? _id;
  String? _name;
  num? _brandID;
  num? _branchID;
  String? _brandName;
  String? _notes;
  num? _createdUserID;
  String? _createdDate;
  String? _updatedDate;
  String? _action;
  bool? _isDefault;
Data copyWith({  String? id,
  String? name,
  num? brandID,
  num? branchID,
  String? brandName,
  String? notes,
  num? createdUserID,
  String? createdDate,
  String? updatedDate,
  String? action,
  bool? isDefault,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  brandID: brandID ?? _brandID,
  branchID: branchID ?? _branchID,
  brandName: brandName ?? _brandName,
  notes: notes ?? _notes,
  createdUserID: createdUserID ?? _createdUserID,
  createdDate: createdDate ?? _createdDate,
  updatedDate: updatedDate ?? _updatedDate,
  action: action ?? _action,
  isDefault: isDefault ?? _isDefault,
);
  String? get id => _id;
  String? get name => _name;
  num? get brandID => _brandID;
  num? get branchID => _branchID;
  String? get brandName => _brandName;
  String? get notes => _notes;
  num? get createdUserID => _createdUserID;
  String? get createdDate => _createdDate;
  String? get updatedDate => _updatedDate;
  String? get action => _action;
  bool? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['BrandID'] = _brandID;
    map['BranchID'] = _branchID;
    map['BrandName'] = _brandName;
    map['Notes'] = _notes;
    map['CreatedUserID'] = _createdUserID;
    map['CreatedDate'] = _createdDate;
    map['UpdatedDate'] = _updatedDate;
    map['Action'] = _action;
    map['IsDefault'] = _isDefault;
    return map;
  }

}