import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Address"
/// data : [{"id":"453282e3-6285-44df-af48-82a94c48a405","AddressID":47,"AddressName":"Default","Address":"Hssbsbsb","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":true},{"id":"a4ceedbe-b94c-4858-b811-23b97b19f51e","AddressID":48,"AddressName":"Dgfjgig","Address":"Cghggy","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":false}]

ListAddressModelClass listAddressModelClassFromJson(String str) => ListAddressModelClass.fromJson(json.decode(str));
String listAddressModelClassToJson(ListAddressModelClass data) => json.encode(data.toJson());
class ListAddressModelClass {
  ListAddressModelClass({
      int? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  ListAddressModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  int? _statusCode;
  String? _message;
  List<Data>? _data;
ListAddressModelClass copyWith({  int? statusCode,
  String? message,
  List<Data>? data,
}) => ListAddressModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get statusCode => _statusCode;
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

/// id : "453282e3-6285-44df-af48-82a94c48a405"
/// AddressID : 47
/// AddressName : "Default"
/// Address : "Hssbsbsb"
/// Areas : "a8b6b73b-4dd5-4867-9993-4caa85324353"
/// AreaName : "Test"
/// IsDefault : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      int? addressID, 
      String? addressName, 
      String? address, 
      String? areas, 
      String? areaName, 
      bool? isDefault,}){
    _id = id;
    _addressID = addressID;
    _addressName = addressName;
    _address = address;
    _areas = areas;
    _areaName = areaName;
    _isDefault = isDefault;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _addressID = json['AddressID'];
    _addressName = json['AddressName'];
    _address = json['Address'];
    _areas = json['Areas'];
    _areaName = json['AreaName'];
    _isDefault = json['IsDefault'];
  }
  String? _id;
  int? _addressID;
  String? _addressName;
  String? _address;
  String? _areas;
  String? _areaName;
  bool? _isDefault;
Data copyWith({  String? id,
  int? addressID,
  String? addressName,
  String? address,
  String? areas,
  String? areaName,
  bool? isDefault,
}) => Data(  id: id ?? _id,
  addressID: addressID ?? _addressID,
  addressName: addressName ?? _addressName,
  address: address ?? _address,
  areas: areas ?? _areas,
  areaName: areaName ?? _areaName,
  isDefault: isDefault ?? _isDefault,
);
  String? get id => _id;
  int? get addressID => _addressID;
  String? get addressName => _addressName;
  String? get address => _address;
  String? get areas => _areas;
  String? get areaName => _areaName;
  bool? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['AddressID'] = _addressID;
    map['AddressName'] = _addressName;
    map['Address'] = _address;
    map['Areas'] = _areas;
    map['AreaName'] = _areaName;
    map['IsDefault'] = _isDefault;
    return map;
  }

}