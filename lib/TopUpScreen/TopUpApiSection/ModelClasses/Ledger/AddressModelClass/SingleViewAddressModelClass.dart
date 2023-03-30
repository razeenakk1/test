import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed AreaDetails"
/// data : {"id":"dde5ca8c-913d-4aa2-bb67-c0b528ab9160","AddressID":4,"AddressName":"Default","Address":"Kozhikode","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true}

SingleViewAddressModelClass singleViewAddressModelClassFromJson(String str) => SingleViewAddressModelClass.fromJson(json.decode(str));
String singleViewAddressModelClassToJson(SingleViewAddressModelClass data) => json.encode(data.toJson());
class SingleViewAddressModelClass {
  SingleViewAddressModelClass({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewAddressModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
SingleViewAddressModelClass copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => SingleViewAddressModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "dde5ca8c-913d-4aa2-bb67-c0b528ab9160"
/// AddressID : 4
/// AddressName : "Default"
/// Address : "Kozhikode"
/// Areas : "6ee8ac6c-b76a-4172-a6af-7c4e47a9881b"
/// AreaName : "Kerala "
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