import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed TaxTypesDetails"
/// data : [{"id":"3f3330c0-56af-4b3e-9489-a98867f35281","TaxTypeID":9,"CreatedDate":"2023-03-22T04:51:43.576719Z","TaxTypeName":"p","PurchaseTax":"35.00000000","SaleTax":"54.00000000"}]

SingleViewTaxModelClass singleViewTaxModelClassFromJson(String str) => SingleViewTaxModelClass.fromJson(json.decode(str));
String singleViewTaxModelClassToJson(SingleViewTaxModelClass data) => json.encode(data.toJson());
class SingleViewTaxModelClass {
  SingleViewTaxModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewTaxModelClass.fromJson(dynamic json) {
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
SingleViewTaxModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => SingleViewTaxModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "3f3330c0-56af-4b3e-9489-a98867f35281"
/// TaxTypeID : 9
/// CreatedDate : "2023-03-22T04:51:43.576719Z"
/// TaxTypeName : "p"
/// PurchaseTax : "35.00000000"
/// SaleTax : "54.00000000"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? taxTypeID, 
      String? createdDate, 
      String? taxTypeName, 
      String? purchaseTax, 
      String? saleTax,}){
    _id = id;
    _taxTypeID = taxTypeID;
    _createdDate = createdDate;
    _taxTypeName = taxTypeName;
    _purchaseTax = purchaseTax;
    _saleTax = saleTax;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _taxTypeID = json['TaxTypeID'];
    _createdDate = json['CreatedDate'];
    _taxTypeName = json['TaxTypeName'];
    _purchaseTax = json['PurchaseTax'];
    _saleTax = json['SaleTax'];
  }
  String? _id;
  num? _taxTypeID;
  String? _createdDate;
  String? _taxTypeName;
  String? _purchaseTax;
  String? _saleTax;
Data copyWith({  String? id,
  num? taxTypeID,
  String? createdDate,
  String? taxTypeName,
  String? purchaseTax,
  String? saleTax,
}) => Data(  id: id ?? _id,
  taxTypeID: taxTypeID ?? _taxTypeID,
  createdDate: createdDate ?? _createdDate,
  taxTypeName: taxTypeName ?? _taxTypeName,
  purchaseTax: purchaseTax ?? _purchaseTax,
  saleTax: saleTax ?? _saleTax,
);
  String? get id => _id;
  num? get taxTypeID => _taxTypeID;
  String? get createdDate => _createdDate;
  String? get taxTypeName => _taxTypeName;
  String? get purchaseTax => _purchaseTax;
  String? get saleTax => _saleTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['TaxTypeID'] = _taxTypeID;
    map['CreatedDate'] = _createdDate;
    map['TaxTypeName'] = _taxTypeName;
    map['PurchaseTax'] = _purchaseTax;
    map['SaleTax'] = _saleTax;
    return map;
  }

}