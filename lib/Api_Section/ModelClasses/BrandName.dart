/// StatusCode : 6000
/// data : [{"id":"a025e3e0-dd4c-4023-95ff-3e5c38c9ef34","name":"Primary Brand","BrandID":1,"BranchID":1,"BrandName":"Primary Brand","Notes":"Default Note","CreatedUserID":1,"CreatedDate":"2023-01-12T11:54:12.232909","UpdatedDate":null,"Action":"A","IsDefault":false}]

class BrandName {
  BrandName({
      num? statusCode, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _data = data;
}

  BrandName.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _statusCode;
  List<Data>? _data;
BrandName copyWith({  num? statusCode,
  List<Data>? data,
}) => BrandName(  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "a025e3e0-dd4c-4023-95ff-3e5c38c9ef34"
/// name : "Primary Brand"
/// BrandID : 1
/// BranchID : 1
/// BrandName : "Primary Brand"
/// Notes : "Default Note"
/// CreatedUserID : 1
/// CreatedDate : "2023-01-12T11:54:12.232909"
/// UpdatedDate : null
/// Action : "A"
/// IsDefault : false

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
      dynamic updatedDate, 
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
  dynamic _updatedDate;
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
  dynamic updatedDate,
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
  dynamic get updatedDate => _updatedDate;
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