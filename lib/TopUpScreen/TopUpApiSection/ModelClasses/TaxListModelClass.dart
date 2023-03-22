import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed TaxTypes"
/// data : [{"id":"7d0ed84f-9a79-4daa-9888-5ad794a0fbb7","TaxTypeName":"two"},{"id":"84f35a98-8c4f-4244-8bca-7931c81bd77c","TaxTypeName":"t"},{"id":"3f3330c0-56af-4b3e-9489-a98867f35281","TaxTypeName":"p"},{"id":"7b889221-b0ee-49d0-ad44-8f1bd6351f51","TaxTypeName":"one"},{"id":"333a4ae6-27f1-4b54-942b-03143f4c21a9","TaxTypeName":"hh"},{"id":"2bdfc991-1c23-47d5-bb77-02ae42ea9420","TaxTypeName":"h"},{"id":"46b0d44a-f8d3-4e77-8c5a-430d879b808b","TaxTypeName":"g"},{"id":"0fd0caec-132d-492c-902d-cbd0bb21cd51","TaxTypeName":"four"},{"id":"dff40f3f-ff85-403b-a38e-76ffe4b8df2c","TaxTypeName":"aa"},{"id":"37ac279f-9a42-46b8-b4ad-e374a278e0f3","TaxTypeName":"New"},{"id":"d15ff8ad-9914-4d3f-861f-8f3778840fae","TaxTypeName":"76"},{"id":"0901a1db-d16c-4fee-a7e0-eb06ecd9bd76","TaxTypeName":"7"},{"id":"3b33ccc6-bf33-424b-b2e3-d1638b299a64","TaxTypeName":"22"},{"id":"82e81413-8efe-4510-ada9-1f1c70581153","TaxTypeName":"2"},{"id":"0e9caa29-785a-42ab-b25c-7f150ffaeaff","TaxTypeName":"18"},{"id":"db499d4e-2f6c-42c5-b580-e62acb9a5246","TaxTypeName":"15"},{"id":"cb4ccbc9-389b-4104-ad9f-f23ad7fba0d0","TaxTypeName":"14"},{"id":"dce0e19e-0135-4231-8043-8c915b680926","TaxTypeName":"13"},{"id":"121f63b6-611a-4403-aeec-197db791b0ce","TaxTypeName":"12%"}]

TaxListModelClass taxListModelClassFromJson(String str) => TaxListModelClass.fromJson(json.decode(str));
String taxListModelClassToJson(TaxListModelClass data) => json.encode(data.toJson());
class TaxListModelClass {
  TaxListModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  TaxListModelClass.fromJson(dynamic json) {
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
TaxListModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => TaxListModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "7d0ed84f-9a79-4daa-9888-5ad794a0fbb7"
/// TaxTypeName : "two"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? taxTypeName,}){
    _id = id;
    _taxTypeName = taxTypeName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _taxTypeName = json['TaxTypeName'];
  }
  String? _id;
  String? _taxTypeName;
Data copyWith({  String? id,
  String? taxTypeName,
}) => Data(  id: id ?? _id,
  taxTypeName: taxTypeName ?? _taxTypeName,
);
  String? get id => _id;
  String? get taxTypeName => _taxTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['TaxTypeName'] = _taxTypeName;
    return map;
  }

}