import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully created Address"
/// AddressID : 27

CreateAddressModelClass createAddressModelClassFromJson(String str) => CreateAddressModelClass.fromJson(json.decode(str));
String createAddressModelClassToJson(CreateAddressModelClass data) => json.encode(data.toJson());
class CreateAddressModelClass {
  CreateAddressModelClass({
      int? statusCode, 
      String? message, 
      int? addressID,}){
    _statusCode = statusCode;
    _message = message;
    _addressID = addressID;
}

  CreateAddressModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _addressID = json['AddressID'];
  }
  int? _statusCode;
  String? _message;
  int? _addressID;
CreateAddressModelClass copyWith({  int? statusCode,
  String? message,
  int? addressID,
}) => CreateAddressModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  addressID: addressID ?? _addressID,
);
  int? get statusCode => _statusCode;
  String? get message => _message;
  int? get addressID => _addressID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    map['message'] = _message;
    map['AddressID'] = _addressID;
    return map;
  }

}