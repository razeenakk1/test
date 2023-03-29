import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed LedgerDetails"
/// data : {"id":"3e01fba9-aade-4447-9af5-55a22b0cd5a2","LedgerID":110,"AccountGroupUnder":29,"LedgerName":"Sundar Cr","Balance":"88.00000000","AsOnDate":"2023-03-29","Details":{"id":"39ded53d-a706-426c-9ef0-f377e7c0f4a4","PartyID":7,"Phone":54648484,"Email":"sggshshshs@gmail.com ","Addresses":[{"id":"40b9b6fe-b7de-48aa-9cd2-7431e551f221","AddressID":18,"Address":"Sjhshshs","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true}],"IsVat":true,"VatNo":"77878676764"}}

SingleViewModelClass singleViewModelClassFromJson(String str) => SingleViewModelClass.fromJson(json.decode(str));
String singleViewModelClassToJson(SingleViewModelClass data) => json.encode(data.toJson());
class SingleViewModelClass {
  SingleViewModelClass({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
SingleViewModelClass copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => SingleViewModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "3e01fba9-aade-4447-9af5-55a22b0cd5a2"
/// LedgerID : 110
/// AccountGroupUnder : 29
/// LedgerName : "Sundar Cr"
/// Balance : "88.00000000"
/// AsOnDate : "2023-03-29"
/// Details : {"id":"39ded53d-a706-426c-9ef0-f377e7c0f4a4","PartyID":7,"Phone":54648484,"Email":"sggshshshs@gmail.com ","Addresses":[{"id":"40b9b6fe-b7de-48aa-9cd2-7431e551f221","AddressID":18,"Address":"Sjhshshs","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true}],"IsVat":true,"VatNo":"77878676764"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      int? ledgerID, 
      int? accountGroupUnder, 
      String? ledgerName, 
      String? balance, 
      String? asOnDate, 
      Details? details,}){
    _id = id;
    _ledgerID = ledgerID;
    _accountGroupUnder = accountGroupUnder;
    _ledgerName = ledgerName;
    _balance = balance;
    _asOnDate = asOnDate;
    _details = details;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _ledgerID = json['LedgerID'];
    _accountGroupUnder = json['AccountGroupUnder'];
    _ledgerName = json['LedgerName'];
    _balance = json['Balance'];
    _asOnDate = json['AsOnDate'];
    _details = json['Details'] != null ? Details.fromJson(json['Details']) : null;
  }
  String? _id;
  int? _ledgerID;
  int? _accountGroupUnder;
  String? _ledgerName;
  String? _balance;
  String? _asOnDate;
  Details? _details;
Data copyWith({  String? id,
  int? ledgerID,
  int? accountGroupUnder,
  String? ledgerName,
  String? balance,
  String? asOnDate,
  Details? details,
}) => Data(  id: id ?? _id,
  ledgerID: ledgerID ?? _ledgerID,
  accountGroupUnder: accountGroupUnder ?? _accountGroupUnder,
  ledgerName: ledgerName ?? _ledgerName,
  balance: balance ?? _balance,
  asOnDate: asOnDate ?? _asOnDate,
  details: details ?? _details,
);
  String? get id => _id;
  int? get ledgerID => _ledgerID;
  int? get accountGroupUnder => _accountGroupUnder;
  String? get ledgerName => _ledgerName;
  String? get balance => _balance;
  String? get asOnDate => _asOnDate;
  Details? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['LedgerID'] = _ledgerID;
    map['AccountGroupUnder'] = _accountGroupUnder;
    map['LedgerName'] = _ledgerName;
    map['Balance'] = _balance;
    map['AsOnDate'] = _asOnDate;
    if (_details != null) {
      map['Details'] = _details?.toJson();
    }
    return map;
  }

}

/// id : "39ded53d-a706-426c-9ef0-f377e7c0f4a4"
/// PartyID : 7
/// Phone : 54648484
/// Email : "sggshshshs@gmail.com "
/// Addresses : [{"id":"40b9b6fe-b7de-48aa-9cd2-7431e551f221","AddressID":18,"Address":"Sjhshshs","Areas":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaName":"Kerala ","IsDefault":true}]
/// IsVat : true
/// VatNo : "77878676764"

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));
String detailsToJson(Details data) => json.encode(data.toJson());
class Details {
  Details({
      String? id, 
      int? partyID, 
      int? phone, 
      String? email, 
      List<Addresses>? addresses, 
      bool? isVat, 
      String? vatNo,}){
    _id = id;
    _partyID = partyID;
    _phone = phone;
    _email = email;
    _addresses = addresses;
    _isVat = isVat;
    _vatNo = vatNo;
}

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _partyID = json['PartyID'];
    _phone = json['Phone'];
    _email = json['Email'];
    if (json['Addresses'] != null) {
      _addresses = [];
      json['Addresses'].forEach((v) {
        _addresses?.add(Addresses.fromJson(v));
      });
    }
    _isVat = json['IsVat'];
    _vatNo = json['VatNo'];
  }
  String? _id;
  int? _partyID;
  int? _phone;
  String? _email;
  List<Addresses>? _addresses;
  bool? _isVat;
  String? _vatNo;
Details copyWith({  String? id,
  int? partyID,
  int? phone,
  String? email,
  List<Addresses>? addresses,
  bool? isVat,
  String? vatNo,
}) => Details(  id: id ?? _id,
  partyID: partyID ?? _partyID,
  phone: phone ?? _phone,
  email: email ?? _email,
  addresses: addresses ?? _addresses,
  isVat: isVat ?? _isVat,
  vatNo: vatNo ?? _vatNo,
);
  String? get id => _id;
  int? get partyID => _partyID;
  int? get phone => _phone;
  String? get email => _email;
  List<Addresses>? get addresses => _addresses;
  bool? get isVat => _isVat;
  String? get vatNo => _vatNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['PartyID'] = _partyID;
    map['Phone'] = _phone;
    map['Email'] = _email;
    if (_addresses != null) {
      map['Addresses'] = _addresses?.map((v) => v.toJson()).toList();
    }
    map['IsVat'] = _isVat;
    map['VatNo'] = _vatNo;
    return map;
  }

}

/// id : "40b9b6fe-b7de-48aa-9cd2-7431e551f221"
/// AddressID : 18
/// Address : "Sjhshshs"
/// Areas : "6ee8ac6c-b76a-4172-a6af-7c4e47a9881b"
/// AreaName : "Kerala "
/// IsDefault : true

Addresses addressesFromJson(String str) => Addresses.fromJson(json.decode(str));
String addressesToJson(Addresses data) => json.encode(data.toJson());
class Addresses {
  Addresses({
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

  Addresses.fromJson(dynamic json) {
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
Addresses copyWith({  String? id,
  int? addressID,
  String? address,
  String? areas,
  String? areaName,
  bool? isDefault,
}) => Addresses(  id: id ?? _id,
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