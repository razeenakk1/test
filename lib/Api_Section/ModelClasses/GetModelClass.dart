import 'dart:convert';
/// StatusCode : 6000
/// data : [{"id":"30f8c506-e27a-476c-8950-b40a6461bf61","CountryCode":"INR","Country_Name":"India","Currency_Name":"Rupee","Change":"Paise","Symbol":"Rs","FractionalUnits":"100.00000000","CurrencySymbolUnicode":"U+20B9","ISD_Code":"+91","Tax_Type":"gst","Flag":null},{"id":"c8ed7839-32ef-4376-badf-08be93cd709f","CountryCode":"KWD","Country_Name":"Kuwait","Currency_Name":"Dinar","Change":"Fils","Symbol":"KD","FractionalUnits":"1000.00000000","CurrencySymbolUnicode":"","ISD_Code":"+965","Tax_Type":"","Flag":null},{"id":"83300f24-91ca-49ce-aa9c-b12dcbb9fe82","CountryCode":"OMR","Country_Name":"Oman","Currency_Name":"Rial","Change":"Baizas","Symbol":"RO","FractionalUnits":"1000.00000000","CurrencySymbolUnicode":"U+FDFC","ISD_Code":"+968","Tax_Type":"vat","Flag":null},{"id":"fcb96ba7-f1f6-43f5-aa8e-3bbc56735fb1","CountryCode":"QAR","Country_Name":"Qatar","Currency_Name":"Riyal","Change":"Dirhams","Symbol":"QR","FractionalUnits":"100.00000000","CurrencySymbolUnicode":"U+FDFC","ISD_Code":"+974","Tax_Type":"","Flag":null},{"id":"94e4ce66-26cc-4851-af1e-ecc068e80224","CountryCode":"SAR","Country_Name":"Saudi Arabia","Currency_Name":"Riyal","Change":"Halala","Symbol":"SR","FractionalUnits":"100.00000000","CurrencySymbolUnicode":"U+FDFC","ISD_Code":"+966","Tax_Type":"vat","Flag":"/media/media/media/country-flags/1_1_xYuEJUZ.png"},{"id":"e688d809-f945-4686-bb95-c709b9715c11","CountryCode":"UAE","Country_Name":"United Arab Emirates","Currency_Name":"Dirham","Change":"Fils","Symbol":"AED","FractionalUnits":"100.00000000","CurrencySymbolUnicode":"","ISD_Code":"+971","Tax_Type":"vat","Flag":"/media/media/country-flags/255px-Flag_of_the_United_Arab_Emirates.svg.png"}]

GetModelClass getModelClassFromJson(String str) => GetModelClass.fromJson(json.decode(str));
String getModelClassToJson(GetModelClass data) => json.encode(data.toJson());
class GetModelClass {
  GetModelClass({
      num? statusCode, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _data = data;
}

  GetModelClass.fromJson(dynamic json) {
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
GetModelClass copyWith({  num? statusCode,
  List<Data>? data,
}) => GetModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "30f8c506-e27a-476c-8950-b40a6461bf61"
/// CountryCode : "INR"
/// Country_Name : "India"
/// Currency_Name : "Rupee"
/// Change : "Paise"
/// Symbol : "Rs"
/// FractionalUnits : "100.00000000"
/// CurrencySymbolUnicode : "U+20B9"
/// ISD_Code : "+91"
/// Tax_Type : "gst"
/// Flag : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? countryCode, 
      String? countryName, 
      String? currencyName, 
      String? change, 
      String? symbol, 
      String? fractionalUnits, 
      String? currencySymbolUnicode, 
      String? iSDCode, 
      String? taxType, 
      dynamic flag,}){
    _id = id;
    _countryCode = countryCode;
    _countryName = countryName;
    _currencyName = currencyName;
    _change = change;
    _symbol = symbol;
    _fractionalUnits = fractionalUnits;
    _currencySymbolUnicode = currencySymbolUnicode;
    _iSDCode = iSDCode;
    _taxType = taxType;
    _flag = flag;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _countryCode = json['CountryCode'];
    _countryName = json['Country_Name'];
    _currencyName = json['Currency_Name'];
    _change = json['Change'];
    _symbol = json['Symbol'];
    _fractionalUnits = json['FractionalUnits'];
    _currencySymbolUnicode = json['CurrencySymbolUnicode'];
    _iSDCode = json['ISD_Code'];
    _taxType = json['Tax_Type'];
    _flag = json['Flag'];
  }
  String? _id;
  String? _countryCode;
  String? _countryName;
  String? _currencyName;
  String? _change;
  String? _symbol;
  String? _fractionalUnits;
  String? _currencySymbolUnicode;
  String? _iSDCode;
  String? _taxType;
  dynamic _flag;
Data copyWith({  String? id,
  String? countryCode,
  String? countryName,
  String? currencyName,
  String? change,
  String? symbol,
  String? fractionalUnits,
  String? currencySymbolUnicode,
  String? iSDCode,
  String? taxType,
  dynamic flag,
}) => Data(  id: id ?? _id,
  countryCode: countryCode ?? _countryCode,
  countryName: countryName ?? _countryName,
  currencyName: currencyName ?? _currencyName,
  change: change ?? _change,
  symbol: symbol ?? _symbol,
  fractionalUnits: fractionalUnits ?? _fractionalUnits,
  currencySymbolUnicode: currencySymbolUnicode ?? _currencySymbolUnicode,
  iSDCode: iSDCode ?? _iSDCode,
  taxType: taxType ?? _taxType,
  flag: flag ?? _flag,
);
  String? get id => _id;
  String? get countryCode => _countryCode;
  String? get countryName => _countryName;
  String? get currencyName => _currencyName;
  String? get change => _change;
  String? get symbol => _symbol;
  String? get fractionalUnits => _fractionalUnits;
  String? get currencySymbolUnicode => _currencySymbolUnicode;
  String? get iSDCode => _iSDCode;
  String? get taxType => _taxType;
  dynamic get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['CountryCode'] = _countryCode;
    map['Country_Name'] = _countryName;
    map['Currency_Name'] = _currencyName;
    map['Change'] = _change;
    map['Symbol'] = _symbol;
    map['FractionalUnits'] = _fractionalUnits;
    map['CurrencySymbolUnicode'] = _currencySymbolUnicode;
    map['ISD_Code'] = _iSDCode;
    map['Tax_Type'] = _taxType;
    map['Flag'] = _flag;
    return map;
  }

}