import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed AreaDetails"
/// data : {"id":"29685dbe-ab12-408c-ab34-ab36821cc9b6","AreaID":5,"AreaName":"doha "}

SingleViewAreaModelClass singleViewAreaModelClassFromJson(String str) => SingleViewAreaModelClass.fromJson(json.decode(str));
String singleViewAreaModelClassToJson(SingleViewAreaModelClass data) => json.encode(data.toJson());
class SingleViewAreaModelClass {
  SingleViewAreaModelClass({
      num? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SingleViewAreaModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  Data? _data;
SingleViewAreaModelClass copyWith({  num? statusCode,
  String? message,
  Data? data,
}) => SingleViewAreaModelClass(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get statusCode => _statusCode;
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

/// id : "29685dbe-ab12-408c-ab34-ab36821cc9b6"
/// AreaID : 5
/// AreaName : "doha "

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? areaID, 
      String? areaName,}){
    _id = id;
    _areaID = areaID;
    _areaName = areaName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _areaID = json['AreaID'];
    _areaName = json['AreaName'];
  }
  String? _id;
  num? _areaID;
  String? _areaName;
Data copyWith({  String? id,
  num? areaID,
  String? areaName,
}) => Data(  id: id ?? _id,
  areaID: areaID ?? _areaID,
  areaName: areaName ?? _areaName,
);
  String? get id => _id;
  num? get areaID => _areaID;
  String? get areaName => _areaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['AreaID'] = _areaID;
    map['AreaName'] = _areaName;
    return map;
  }

}