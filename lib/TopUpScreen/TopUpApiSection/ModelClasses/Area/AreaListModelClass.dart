import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Area"
/// data : [{"id":"29685dbe-ab12-408c-ab34-ab36821cc9b6","AreaID":5,"AreaName":"doha "},{"id":"9b34f738-2822-4d17-9dd9-111fc238c689","AreaID":6,"AreaName":"doha "},{"id":"0a47dcbf-79fc-4bea-bee5-ab7cdb9fa35c","AreaID":8,"AreaName":"doha"},{"id":"a57b323b-e051-4251-8417-18c03c5018dc","AreaID":7,"AreaName":"dhoha "},{"id":"3c58555d-13a3-4bea-8c4a-dfaf47300d83","AreaID":3,"AreaName":"Qatar "},{"id":"6ee8ac6c-b76a-4172-a6af-7c4e47a9881b","AreaID":1,"AreaName":"Kerala"},{"id":"96298d04-bb5b-485b-9682-276be9037e6b","AreaID":2,"AreaName":"Kerala"},{"id":"8dd3cf10-e5e0-4ee1-b336-f984f2d4811e","AreaID":4,"AreaName":"Doha "}]

AreaListModelClass areaListModelClassFromJson(String str) => AreaListModelClass.fromJson(json.decode(str));
String areaListModelClassToJson(AreaListModelClass data) => json.encode(data.toJson());
class AreaListModelClass {
  AreaListModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  AreaListModelClass.fromJson(dynamic json) {
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
AreaListModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => AreaListModelClass(  statusCode: statusCode ?? _statusCode,
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