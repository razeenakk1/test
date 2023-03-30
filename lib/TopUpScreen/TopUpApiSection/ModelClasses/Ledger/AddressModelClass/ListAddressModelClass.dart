import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Address"
/// data : [{"id":"40b9b6fe-b7de-48aa-9cd2-7431e551f221","AddressID":18,"Address":"Sjhshshs","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"396687af-1ff3-4b91-9ed5-c1ef98dae463","AddressID":32,"Address":"Kunnummal House karakkunnu, thrikalangode PO Malappuram District Kerala 676123","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":false},{"id":"32a1bc2e-149d-4c08-a1f7-8187db980d4a","AddressID":33,"Address":"Kunnummal House karakkunnu, thrikalangode PO Malappuram District Kerala 676123","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":false},{"id":"122665a5-66cd-4c45-91ff-cbc25989e047","AddressID":1,"Address":"Kozhikode","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"ce40dbdd-bf78-4609-ab29-7b8e487487ad","AddressID":2,"Address":"Kozhikode","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"ed22afb5-e910-46fb-afba-f6d9b58d90df","AddressID":3,"Address":"Kozhikode","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"dde5ca8c-913d-4aa2-bb67-c0b528ab9160","AddressID":4,"Address":"Kozhikode","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"a377a31d-2e90-4fd5-b82c-e102f4c3d212","AddressID":5,"Address":"Hdtyhh","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"d0dd491c-d1b8-47af-8551-0c7ae939e04f","AddressID":34,"Address":"Chfjhkhkhkh\nChfjhkhkjl\nBchfjhkhkh\nVkhkho","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":false},{"id":"eff35bc2-ff14-4f71-85fc-79679ff52f9f","AddressID":29,"Address":"Avwvbw","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":true},{"id":"209f556b-51de-41f9-8c99-528c27be101d","AddressID":6,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"072f3071-f2ce-49e4-b384-3395df8ae5dd","AddressID":7,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"d016fa02-2cf2-4c86-a077-3616f3fea568","AddressID":8,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"e86510d5-b58a-4adb-a3c5-8ef7d085a655","AddressID":9,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"3bae4ca6-f89c-49ec-b313-731f0233142b","AddressID":10,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"305ebc90-6a7c-4cef-9aaf-96be74e39cd4","AddressID":11,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"dd461925-1693-4732-a595-a329acc8fe05","AddressID":12,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"743137ec-d618-427f-bee9-a2f3a4c4b846","AddressID":13,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"fa99ccd4-4a26-4490-980e-3d0c1af44323","AddressID":14,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"323f0d59-6e59-4d78-ae6a-02a4af66b8a2","AddressID":15,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"a059459f-22a4-4c37-bf01-60592e736143","AddressID":16,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"a33c4e3a-272f-4887-80ff-e50a33128a69","AddressID":19,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"80d9e28e-0614-463b-88cd-40b93555c9b4","AddressID":20,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"1f85c503-01b9-4a22-986b-22ebdf200857","AddressID":21,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"b914db37-b52a-45b3-b96d-1e36f1f9b90d","AddressID":23,"Address":"","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":true},{"id":"1f4d7a97-c893-44e4-90c6-512e9d82bf5f","AddressID":24,"Address":"","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true},{"id":"a0bc078e-4279-44d1-a516-f4241798c326","AddressID":26,"Address":"","Areas":"a8b6b73b-4dd5-4867-9993-4caa85324353","AreaName":"Test","IsDefault":true}]

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

/// id : "40b9b6fe-b7de-48aa-9cd2-7431e551f221"
/// AddressID : 18
/// Address : "Sjhshshs"
/// Areas : "6ee8ac6c-b76a-4172-a6af-7c4e47a9881b"
/// AreaName : "Kerala "
/// IsDefault : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      int? addressID, 
      String? address, 
      String? areas, 
      String? areaName, 
      bool? isDefault,}){
    _id = id;
    _addressID = addressID;
    _address = address;
    _areas = areas;
    _areaName = areaName;
    _isDefault = isDefault;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _addressID = json['AddressID'];
    _address = json['Address'];
    _areas = json['Areas'];
    _areaName = json['AreaName'];
    _isDefault = json['IsDefault'];
  }
  String? _id;
  int? _addressID;
  String? _address;
  String? _areas;
  String? _areaName;
  bool? _isDefault;
Data copyWith({  String? id,
  int? addressID,
  String? address,
  String? areas,
  String? areaName,
  bool? isDefault,
}) => Data(  id: id ?? _id,
  addressID: addressID ?? _addressID,
  address: address ?? _address,
  areas: areas ?? _areas,
  areaName: areaName ?? _areaName,
  isDefault: isDefault ?? _isDefault,
);
  String? get id => _id;
  int? get addressID => _addressID;
  String? get address => _address;
  String? get areas => _areas;
  String? get areaName => _areaName;
  bool? get isDefault => _isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['AddressID'] = _addressID;
    map['Address'] = _address;
    map['Areas'] = _areas;
    map['AreaName'] = _areaName;
    map['IsDefault'] = _isDefault;
    return map;
  }

}