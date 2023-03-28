import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Ledger"
/// data : [{"id":"eb5ffd4e-9522-4052-9773-dd8fa4cd10ab","LedgerID":58,"AccountGroupUnder":30,"LedgerName":"Zakkath","Balance":"0.00000000"},{"id":"415554fd-eabf-4f3f-b731-e7e421a398f3","LedgerID":26,"AccountGroupUnder":79,"LedgerName":"VAT on service Sales","Balance":"0.00000000"},{"id":"a27b2c9d-177c-48ee-ad4f-686aadab77a5","LedgerID":57,"AccountGroupUnder":78,"LedgerName":"VAT on Service Purchase","Balance":"0.00000000"},{"id":"8ecd354a-52f9-407d-bb8f-649cbd8f5ee6","LedgerID":55,"AccountGroupUnder":79,"LedgerName":"VAT on Sales","Balance":"0.00000000"},{"id":"c960d281-2471-4ba4-85d8-12a3fb122c27","LedgerID":25,"AccountGroupUnder":79,"LedgerName":"VAT on Receipt","Balance":"0.00000000"},{"id":"6adf9d32-3d52-4405-ad4e-e878ba3aee23","LedgerID":56,"AccountGroupUnder":78,"LedgerName":"VAT on Purchase(Outside State)","Balance":"0.00000000"},{"id":"bf154d5d-68ae-48a6-b427-9986a7db2367","LedgerID":54,"AccountGroupUnder":78,"LedgerName":"VAT on Purchase","Balance":"0.00000000"},{"id":"b5126cb0-dfe6-45f1-95a6-e0c83529075f","LedgerID":53,"AccountGroupUnder":78,"LedgerName":"VAT on Payment","Balance":"0.00000000"},{"id":"00341aa9-afbd-49e8-afd8-82b71b9ac69b","LedgerID":24,"AccountGroupUnder":79,"LedgerName":"VAT on Expense","Balance":"0.00000000"},{"id":"46576da1-b840-423e-afa3-e901da0340c0","LedgerID":23,"AccountGroupUnder":85,"LedgerName":"Tax3 on service Sales","Balance":"0.00000000"},{"id":"28485039-98a8-4817-9683-2b30b8e65635","LedgerID":52,"AccountGroupUnder":84,"LedgerName":"Tax3 on Service Purchase","Balance":"0.00000000"},{"id":"dda9880e-f22a-4cc5-83fe-615ce0a2cf50","LedgerID":22,"AccountGroupUnder":85,"LedgerName":"Tax3 on Sales","Balance":"0.00000000"},{"id":"798053b6-9b85-4737-a9d8-ad1e83a70363","LedgerID":21,"AccountGroupUnder":85,"LedgerName":"Tax3 on Receipt","Balance":"0.00000000"},{"id":"f73e6ab2-a99f-47e4-acef-4b97b32a2c69","LedgerID":51,"AccountGroupUnder":84,"LedgerName":"Tax3 on Purchase","Balance":"0.00000000"},{"id":"a86b164c-8b92-4c5a-84cd-066982ffe7ea","LedgerID":50,"AccountGroupUnder":84,"LedgerName":"Tax3 on Payment","Balance":"0.00000000"},{"id":"abbdb4a2-52a0-4255-a1be-22acb470f1c2","LedgerID":20,"AccountGroupUnder":83,"LedgerName":"Tax2 on service Sales","Balance":"0.00000000"},{"id":"032ceb68-cc7f-4c36-acd2-37c78b166528","LedgerID":49,"AccountGroupUnder":82,"LedgerName":"Tax2 on Service Purchase","Balance":"0.00000000"},{"id":"00e9daff-a89e-46d7-a7bc-ca9381a4567b","LedgerID":19,"AccountGroupUnder":83,"LedgerName":"Tax2 on Sales","Balance":"0.00000000"},{"id":"dffcf8fd-3133-41c2-83f5-396682808f80","LedgerID":18,"AccountGroupUnder":83,"LedgerName":"Tax2 on Receipt","Balance":"0.00000000"},{"id":"a74c1514-a895-486d-a3e3-95d5089fc9c8","LedgerID":48,"AccountGroupUnder":82,"LedgerName":"Tax2 on Purchase","Balance":"0.00000000"},{"id":"16a021cd-8e8b-46bb-9410-86e10a55c940","LedgerID":47,"AccountGroupUnder":82,"LedgerName":"Tax2 on Payment","Balance":"0.00000000"},{"id":"26703438-246b-42c4-b1b7-e93d2078966c","LedgerID":17,"AccountGroupUnder":81,"LedgerName":"Tax1 on service Sales","Balance":"0.00000000"},{"id":"f71d7fa2-518d-421c-a88a-dc91eae584a0","LedgerID":46,"AccountGroupUnder":80,"LedgerName":"Tax1 on Service Purchase","Balance":"0.00000000"},{"id":"790627c7-f19f-492d-9d9a-30d1b54e136e","LedgerID":16,"AccountGroupUnder":81,"LedgerName":"Tax1 on Sales","Balance":"0.00000000"},{"id":"ba02d4e1-4014-4679-b1ed-b966ac0a5579","LedgerID":15,"AccountGroupUnder":81,"LedgerName":"Tax1 on Receipt","Balance":"0.00000000"},{"id":"ae03d309-e746-4ad0-9701-ba428f157d2e","LedgerID":45,"AccountGroupUnder":80,"LedgerName":"Tax1 on Purchase","Balance":"0.00000000"},{"id":"61a3cc9c-46dd-4d55-b51e-eb534eb42f80","LedgerID":44,"AccountGroupUnder":80,"LedgerName":"Tax1 on Payment","Balance":"0.00000000"},{"id":"36ecf9c6-5c83-4e5d-907a-2f0e2b6a0741","LedgerID":71,"AccountGroupUnder":48,"LedgerName":"Surcharge Purchase","Balance":"0.00000000"},{"id":"ae0f9c89-0517-4c75-affb-44f87f9192fc","LedgerID":87,"AccountGroupUnder":77,"LedgerName":"Service Sales Account","Balance":"0.00000000"},{"id":"4538d92e-2ced-4d7a-8cf2-eb9229b5be08","LedgerID":81,"AccountGroupUnder":62,"LedgerName":"Service  Purchase Account","Balance":"0.00000000"},{"id":"e3d0bf3f-c76e-478b-bfcd-082b44424ac0","LedgerID":86,"AccountGroupUnder":74,"LedgerName":"Sales Return Account","Balance":"0.00000000"},{"id":"058c4f9d-166b-405e-a538-312064fe5cad","LedgerID":85,"AccountGroupUnder":74,"LedgerName":"Sales Account","Balance":"0.00000000"},{"id":"b130ed27-cc61-4c89-b7f8-7962444dbd52","LedgerID":80,"AccountGroupUnder":58,"LedgerName":"Round off Service Sales","Balance":"0.00000000"},{"id":"8a0154c4-bad7-4f39-af24-d02b696edcac","LedgerID":79,"AccountGroupUnder":58,"LedgerName":"Round off Service Purchase","Balance":"0.00000000"},{"id":"a394d9e6-f7e7-4194-ad06-f7ab6142a129","LedgerID":78,"AccountGroupUnder":58,"LedgerName":"Round off Sales","Balance":"0.00000000"},{"id":"25a5a858-e51a-42bd-b175-7d5de7b4396b","LedgerID":77,"AccountGroupUnder":58,"LedgerName":"Round off Purchase","Balance":"0.00000000"},{"id":"1e6a902c-9068-4186-b4cb-293860271ec0","LedgerID":32,"AccountGroupUnder":88,"LedgerName":"Real Estate","Balance":"0.00000000"},{"id":"db92dfd1-ed13-47e9-b1e1-cb182ee888b5","LedgerID":93,"AccountGroupUnder":null,"LedgerName":"Rabee","Balance":"0.00000000"},{"id":"0fa98a5b-634b-4f0b-92b9-d7d293be6736","LedgerID":70,"AccountGroupUnder":48,"LedgerName":"Purchase Return Account","Balance":"0.00000000"},{"id":"189bf22e-31ac-4743-9811-94e01d993357","LedgerID":69,"AccountGroupUnder":48,"LedgerName":"Purchase Account","Balance":"0.00000000"},{"id":"04db21fa-4baa-45a5-8133-611e39ee6a90","LedgerID":66,"AccountGroupUnder":39,"LedgerName":"Profit/Loss for Previous year","Balance":"0.00000000"},{"id":"68c3659d-f609-4532-b1ea-fd50cbe394a9","LedgerID":88,"AccountGroupUnder":71,"LedgerName":"Professional Fees","Balance":"0.00000000"},{"id":"03195ae1-72a1-401d-ae66-5f4ab29a981a","LedgerID":34,"AccountGroupUnder":7,"LedgerName":"Preliminary Expense","Balance":"0.00000000"},{"id":"4bf2b738-04a7-498e-9ad8-f4b17f7dede5","LedgerID":33,"AccountGroupUnder":7,"LedgerName":"P&L Balance","Balance":"0.00000000"},{"id":"57a490cd-a845-4e92-adc5-b23b0ae15d7f","LedgerID":64,"AccountGroupUnder":31,"LedgerName":"Outstanding Salary","Balance":"0.00000000"},{"id":"a1a9874e-3881-40f6-9256-03423e2ec179","LedgerID":31,"AccountGroupUnder":88,"LedgerName":"Others","Balance":"0.00000000"},{"id":"34f27149-3ecb-4b18-a60b-9387a8adb02b","LedgerID":67,"AccountGroupUnder":45,"LedgerName":"Opening Stock","Balance":"0.00000000"},{"id":"200141c0-87ae-4c74-9a0b-f42a46475efd","LedgerID":30,"AccountGroupUnder":88,"LedgerName":"Mutual Funds","Balance":"0.00000000"},{"id":"fdf5b6a6-613e-46c6-a3b4-0d8eab2e6972","LedgerID":14,"AccountGroupUnder":87,"LedgerName":"Excise Duty on Service Sales","Balance":"0.00000000"},{"id":"c9760824-108c-45b5-a7a9-a39af807b6d9","LedgerID":59,"AccountGroupUnder":86,"LedgerName":"Excise Duty on Service Purchase","Balance":"0.00000000"},{"id":"5732bef0-d2ef-4172-8030-9090af70a8ff","LedgerID":13,"AccountGroupUnder":87,"LedgerName":"Excise Duty on Sales","Balance":"0.00000000"},{"id":"84b3a973-6a94-4e3f-945d-69f94a116eae","LedgerID":68,"AccountGroupUnder":48,"LedgerName":"Excise Duty on Purchase","Balance":"0.00000000"},{"id":"05222fa5-44d5-42a8-824b-3228cf4b0c42","LedgerID":29,"AccountGroupUnder":88,"LedgerName":"Equit Share","Balance":"0.00000000"},{"id":"1cc49572-0fc0-4dfd-8355-7434a8a47aae","LedgerID":75,"AccountGroupUnder":55,"LedgerName":"Discount on Service Sales","Balance":"0.00000000"},{"id":"8f3bd8db-1090-4487-be8f-ec20abd3fe29","LedgerID":84,"AccountGroupUnder":73,"LedgerName":"Discount on Service Purchase","Balance":"0.00000000"},{"id":"593703e7-b0a4-4023-bd5e-53fcd1b3cc10","LedgerID":74,"AccountGroupUnder":55,"LedgerName":"Discount on Sales","Balance":"0.00000000"},{"id":"e5e0e38d-8420-49dc-ab35-fcc0e5eec584","LedgerID":72,"AccountGroupUnder":55,"LedgerName":"Discount on Receipt","Balance":"0.00000000"},{"id":"3c49502e-e401-47da-ba2b-0856323e54b7","LedgerID":83,"AccountGroupUnder":73,"LedgerName":"Discount on Purchase","Balance":"0.00000000"},{"id":"ee703c91-b837-435d-85fc-6b8d9c967e83","LedgerID":82,"AccountGroupUnder":73,"LedgerName":"Discount on Payment","Balance":"0.00000000"},{"id":"ad98072f-1e65-4872-958d-30a605f37783","LedgerID":73,"AccountGroupUnder":55,"LedgerName":"Discount on Loyalty","Balance":"0.00000000"},{"id":"4a6ab2d8-53f9-465f-8670-69b2787d1110","LedgerID":76,"AccountGroupUnder":55,"LedgerName":"Discount on Celebration","Balance":"0.00000000"},{"id":"625863aa-1e2e-41d9-ab8c-8303ca285c56","LedgerID":28,"AccountGroupUnder":15,"LedgerName":"Credit Card Received","Balance":"0.00000000"},{"id":"2a955360-af13-452c-aaa7-23977b486b67","LedgerID":27,"AccountGroupUnder":15,"LedgerName":"Cheques Received","Balance":"0.00000000"},{"id":"7c97ee14-1fe2-4d90-b713-1c1e9be97c54","LedgerID":1,"AccountGroupUnder":9,"LedgerName":"Cash In Hand","Balance":"0.00000000"},{"id":"2fc8e2c7-99c4-4528-944a-777d83a9e1ee","LedgerID":65,"AccountGroupUnder":37,"LedgerName":"Capital","Balance":"0.00000000"},{"id":"3f9f89e8-d6b2-449d-aa6c-58f13082df9c","LedgerID":92,"AccountGroupUnder":8,"LedgerName":"Bank","Balance":"0.00000000"},{"id":"e0fc5d54-d60b-4ffb-a936-402102828460","LedgerID":63,"AccountGroupUnder":89,"LedgerName":"Additional Tax on Service Sales","Balance":"0.00000000"},{"id":"0fddebe4-19d2-4af1-b20b-53444e6e4400","LedgerID":62,"AccountGroupUnder":94,"LedgerName":"Additional Tax on Service Purchase","Balance":"0.00000000"},{"id":"937f399e-614f-43b1-b649-b693d1c923b4","LedgerID":61,"AccountGroupUnder":89,"LedgerName":"Additional Tax on Sales","Balance":"0.00000000"},{"id":"760e3764-e2e2-497b-8d98-f31f9c79276c","LedgerID":60,"AccountGroupUnder":94,"LedgerName":"Additional Tax on Purchase","Balance":"0.00000000"}]

LedgerListModelClass ledgerListModelClassFromJson(String str) => LedgerListModelClass.fromJson(json.decode(str));
String ledgerListModelClassToJson(LedgerListModelClass data) => json.encode(data.toJson());
class LedgerListModelClass {
  LedgerListModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  LedgerListModelClass.fromJson(dynamic json) {
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
LedgerListModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => LedgerListModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "eb5ffd4e-9522-4052-9773-dd8fa4cd10ab"
/// LedgerID : 58
/// AccountGroupUnder : 30
/// LedgerName : "Zakkath"
/// Balance : "0.00000000"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      num? ledgerID, 
      num? accountGroupUnder, 
      String? ledgerName, 
      String? balance,}){
    _id = id;
    _ledgerID = ledgerID;
    _accountGroupUnder = accountGroupUnder;
    _ledgerName = ledgerName;
    _balance = balance;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _ledgerID = json['LedgerID'];
    _accountGroupUnder = json['AccountGroupUnder'];
    _ledgerName = json['LedgerName'];
    _balance = json['Balance'];
  }
  String? _id;
  num? _ledgerID;
  num? _accountGroupUnder;
  String? _ledgerName;
  String? _balance;
Data copyWith({  String? id,
  num? ledgerID,
  num? accountGroupUnder,
  String? ledgerName,
  String? balance,
}) => Data(  id: id ?? _id,
  ledgerID: ledgerID ?? _ledgerID,
  accountGroupUnder: accountGroupUnder ?? _accountGroupUnder,
  ledgerName: ledgerName ?? _ledgerName,
  balance: balance ?? _balance,
);
  String? get id => _id;
  num? get ledgerID => _ledgerID;
  num? get accountGroupUnder => _accountGroupUnder;
  String? get ledgerName => _ledgerName;
  String? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['LedgerID'] = _ledgerID;
    map['AccountGroupUnder'] = _accountGroupUnder;
    map['LedgerName'] = _ledgerName;
    map['Balance'] = _balance;
    return map;
  }

}