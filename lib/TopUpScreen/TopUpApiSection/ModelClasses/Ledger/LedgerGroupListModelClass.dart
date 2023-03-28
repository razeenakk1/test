import 'dart:convert';
/// StatusCode : 6000
/// message : "Successfully listed Ledger"
/// data : [{"id":"17d2ba7a-5743-45ec-a8e0-02aea4f17339","AccountGroupName":"Wages","AccountGroupID":90,"GroupCode":"GP91"},{"id":"fdebf0e2-8bf6-4eef-a77d-7574cbcea10d","AccountGroupName":"VAT Receivable","AccountGroupID":78,"GroupCode":"GP79"},{"id":"96c877c5-fad6-4b6b-bad0-d1bee14192ee","AccountGroupName":"VAT Payable","AccountGroupID":79,"GroupCode":"GP80"},{"id":"fc80cfb2-5dc8-4f4c-8bb1-b467f096a262","AccountGroupName":"Unsecured Lons","AccountGroupID":35,"GroupCode":"GP36"},{"id":"6b6f5e3a-1556-455d-83a4-9070a2b61d24","AccountGroupName":"Uncleared Receipts","AccountGroupID":15,"GroupCode":"GP16"},{"id":"7323355c-28ff-4625-86cc-03467fb81edc","AccountGroupName":"Tax3 Receivable","AccountGroupID":84,"GroupCode":"GP85"},{"id":"8be10412-6179-4120-9f7b-1af34de53f6b","AccountGroupName":"Tax3 Payable","AccountGroupID":85,"GroupCode":"GP86"},{"id":"97f9acf2-64a7-4e3d-a2b9-708882bdf8e6","AccountGroupName":"Tax2 Receivable","AccountGroupID":82,"GroupCode":"GP83"},{"id":"06c127e0-1852-4450-847a-c76cccb9b8cd","AccountGroupName":"Tax2 Payable","AccountGroupID":83,"GroupCode":"GP84"},{"id":"a53b3089-04b9-48fc-aa98-cf1b41b53cb9","AccountGroupName":"Tax1 Receivable","AccountGroupID":80,"GroupCode":"GP81"},{"id":"db508c9f-be73-40e7-8513-e7f461d92e74","AccountGroupName":"Tax1 Payable","AccountGroupID":81,"GroupCode":"GP82"},{"id":"256e800e-0afe-4244-9a12-c9878cc6e46e","AccountGroupName":"Suspense Accounts","AccountGroupID":26,"GroupCode":"GP27"},{"id":"5e8da8a3-cbec-4e0e-a04e-2e68f1d9f902","AccountGroupName":"Sundry Debtors","AccountGroupID":10,"GroupCode":"GP11"},{"id":"ef7fd4d1-3ea5-4578-8175-3b8462effb44","AccountGroupName":"Sundry Creditors","AccountGroupID":29,"GroupCode":"GP30"},{"id":"ac84d434-4573-4a63-86a5-766d7269abb8","AccountGroupName":"Staff Welfare","AccountGroupID":63,"GroupCode":"GP64"},{"id":"baabee43-b202-41d5-8ef1-42fa52f3df85","AccountGroupName":"Service Sales","AccountGroupID":77,"GroupCode":"GP78"},{"id":"5e76c615-564d-4465-b968-5142d9eab640","AccountGroupName":"Service  Purchase","AccountGroupID":62,"GroupCode":"GP63"},{"id":"b9ec3c29-cfb9-43ac-8d98-1e073174e7ee","AccountGroupName":"Secured Loans","AccountGroupID":34,"GroupCode":"GP35"},{"id":"37c94f05-408e-4e03-b03b-999c42b0fefe","AccountGroupName":"Salesman Commission","AccountGroupID":92,"GroupCode":"GP93"},{"id":"a72e46fe-450b-476a-b368-cc6de7b15efe","AccountGroupName":"Sales","AccountGroupID":74,"GroupCode":"GP75"},{"id":"a3f5bd5f-a0fc-473e-9757-cbb468af168b","AccountGroupName":"Salary Payable","AccountGroupID":32,"GroupCode":"GP33"},{"id":"04f6703a-254c-4f1b-871f-4f511de3566c","AccountGroupName":"Salaries & Incentives","AccountGroupID":61,"GroupCode":"GP62"},{"id":"0707a803-d911-4685-9e1b-d04a932100e7","AccountGroupName":"Salaries","AccountGroupID":69,"GroupCode":"GP70"},{"id":"e491a91b-d9be-4faa-bd87-6e6a36b9ce12","AccountGroupName":"Reserves & Surplus","AccountGroupID":38,"GroupCode":"GP39"},{"id":"dd0eb6d1-c3e3-4855-a525-521acea0fe97","AccountGroupName":"Rent","AccountGroupID":60,"GroupCode":"GP61"},{"id":"2ebf634a-9cc0-44eb-b25b-2230b8f4b3d4","AccountGroupName":"Purchase","AccountGroupID":48,"GroupCode":"GP49"},{"id":"86cda886-0fe2-4056-be3e-0481ce442205","AccountGroupName":"Provisions for Expense","AccountGroupID":31,"GroupCode":"GP32"},{"id":"5c130408-6d1c-4f31-9117-d07eae244585","AccountGroupName":"Profit/Loss for Previous year","AccountGroupID":39,"GroupCode":"GP40"},{"id":"448fe8eb-de30-4664-b79e-ac5ad3a4d5eb","AccountGroupName":"Profit & Loss Account","AccountGroupID":2,"GroupCode":"GP3"},{"id":"b9868bf1-b075-4485-b08a-db4342b58a99","AccountGroupName":"Production Expenses","AccountGroupID":47,"GroupCode":"GP48"},{"id":"efd91e20-6cb9-4bdf-adee-a245ac772fe3","AccountGroupName":"Product Resources","AccountGroupID":46,"GroupCode":"GP47"},{"id":"732208f8-b5b1-4de2-b2aa-cd586c39f640","AccountGroupName":"Printing & Stationeries","AccountGroupID":66,"GroupCode":"GP67"},{"id":"c80f7521-6ada-4670-af06-6366d11e1911","AccountGroupName":"Postage & Telegrams","AccountGroupID":65,"GroupCode":"GP66"},{"id":"583d3e4f-8a5e-4aec-a0f0-90d68fe6af28","AccountGroupName":"Owners Funds","AccountGroupID":25,"GroupCode":"GP26"},{"id":"6cb0bc59-3180-46ab-9ba9-e2be6fb6acb7","AccountGroupName":"Other Income","AccountGroupID":76,"GroupCode":"GP77"},{"id":"277dcbf6-a906-41e7-8a83-0f66967e748c","AccountGroupName":"Other Expenses","AccountGroupID":59,"GroupCode":"GP60"},{"id":"e4a0038b-5445-4056-bfa7-aec23c94b0fc","AccountGroupName":"Opening Stock","AccountGroupID":45,"GroupCode":"GP46"},{"id":"d4dd08ce-b81d-4c84-8bf0-f8411033df67","AccountGroupName":"Office Expenses","AccountGroupID":64,"GroupCode":"GP65"},{"id":"eeb90441-dbde-4813-a685-65cf868c8f66","AccountGroupName":"Movable Assets","AccountGroupID":21,"GroupCode":"GP22"},{"id":"4d9d2709-7b14-480c-ae2f-88aee75c6d9e","AccountGroupName":"Miscellaneous Expenses","AccountGroupID":58,"GroupCode":"GP59"},{"id":"d5dd92ed-c159-494f-ab60-d2875e0c1125","AccountGroupName":"Miscellaneous Assets","AccountGroupID":7,"GroupCode":"GP8"},{"id":"c61dc6ee-0fb4-4ba7-81c3-5a8e826d8657","AccountGroupName":"Marketing Expenses","AccountGroupID":67,"GroupCode":"GP68"},{"id":"35ce0ee2-12b3-49d2-b530-f3f8e1244f6c","AccountGroupName":"Loans from Partners","AccountGroupID":36,"GroupCode":"GP37"},{"id":"3b30d8a3-1fe1-412b-8463-08c32c4ca1b7","AccountGroupName":"Loans Given","AccountGroupID":19,"GroupCode":"GP20"},{"id":"cf2f6cb8-4bba-4573-8689-972a1aee71c4","AccountGroupName":"Loans & Advances","AccountGroupID":14,"GroupCode":"GP15"},{"id":"f4a9798d-cf53-445e-be64-b4e800de1ae8","AccountGroupName":"Loan Funds","AccountGroupID":24,"GroupCode":"GP25"},{"id":"df69a0a2-a579-4f8e-b391-3c1749f63059","AccountGroupName":"Liabilitis","AccountGroupID":4,"GroupCode":"GP5"},{"id":"1d7fddb7-f87a-4c48-9cca-4670e7d77099","AccountGroupName":"Investments","AccountGroupID":88,"GroupCode":"GP89"},{"id":"8c96b33b-3a66-4827-8d5e-2036d8572b61","AccountGroupName":"Inventory","AccountGroupID":13,"GroupCode":"GP14"},{"id":"193df282-9756-4cf0-8ad5-d2b9bcd0502b","AccountGroupName":"Interest Received","AccountGroupID":75,"GroupCode":"GP76"},{"id":"4b31c5e0-99b8-4258-af64-c4d25c1a5991","AccountGroupName":"Interest Given","AccountGroupID":57,"GroupCode":"GP58"},{"id":"90cec625-df09-45a0-adf2-834a1dcff9c5","AccountGroupName":"Interest","AccountGroupID":56,"GroupCode":"GP57"},{"id":"c097e36c-deba-4169-8b22-dad8dee3065e","AccountGroupName":"Insurance","AccountGroupID":12,"GroupCode":"GP13"},{"id":"c91cc9bb-b7fa-461c-b29d-0275edec611d","AccountGroupName":"Indirect Income","AccountGroupID":71,"GroupCode":"GP72"},{"id":"828cf097-c1cd-4531-a1a3-3f455a4be21c","AccountGroupName":"Indirect Expenses","AccountGroupID":43,"GroupCode":"GP44"},{"id":"73d1a2ff-3192-4862-9692-4758247a3070","AccountGroupName":"Income","AccountGroupID":41,"GroupCode":"GP42"},{"id":"86c9fb70-5209-450a-9f98-86d4778d1518","AccountGroupName":"Incentives","AccountGroupID":68,"GroupCode":"GP69"},{"id":"f5a1612a-9fe5-49fb-82be-34c13afbbd8a","AccountGroupName":"Immovable Assets","AccountGroupID":20,"GroupCode":"GP21"},{"id":"f94fba26-a862-46cf-afd9-e4a492ba619d","AccountGroupName":"GST Receivable","AccountGroupID":22,"GroupCode":"GP23"},{"id":"c3d6c6df-4557-4f92-b96b-61d3b868d327","AccountGroupName":"GST Payable","AccountGroupID":33,"GroupCode":"GP34"},{"id":"8dbbd223-fcbe-4c4e-939b-76c21695bb0a","AccountGroupName":"Freight","AccountGroupID":49,"GroupCode":"GP50"},{"id":"983f71d0-e7d8-4dc6-9db0-7fc3e0424f3d","AccountGroupName":"Fixed Assets","AccountGroupID":6,"GroupCode":"GP7"},{"id":"186a32fe-b709-4a0e-bb29-343c07b03a01","AccountGroupName":"Expenses","AccountGroupID":40,"GroupCode":"GP41"},{"id":"d3abda1f-e00f-4e2b-82d7-7213aa3ab0a1","AccountGroupName":"Excise Duty Receivable","AccountGroupID":86,"GroupCode":"GP87"},{"id":"76d40eae-fccf-4209-8a7d-330f7b34c010","AccountGroupName":"Excise Duty Payable","AccountGroupID":87,"GroupCode":"GP88"},{"id":"eb89550e-199d-4929-87fd-94cf0e3c7f03","AccountGroupName":"Duties & Taxes Receivable","AccountGroupID":11,"GroupCode":"GP12"},{"id":"2093d9fd-5285-4482-bf60-231a1cce2275","AccountGroupName":"Duties & Taxes Payable","AccountGroupID":30,"GroupCode":"GP31"},{"id":"a5063ffb-b1e2-41b4-b120-4b520baabd69","AccountGroupName":"Discount Received","AccountGroupID":73,"GroupCode":"GP74"},{"id":"bf3c275a-65b3-46f5-9bc3-f21057a33411","AccountGroupName":"Discount Given","AccountGroupID":55,"GroupCode":"GP56"},{"id":"900dbebf-6112-4d1a-bd5e-c3023dd3649d","AccountGroupName":"Direct Income","AccountGroupID":70,"GroupCode":"GP71"},{"id":"0c8170da-afaf-4a78-aa48-c2bf840f61d4","AccountGroupName":"Direct Expenses","AccountGroupID":42,"GroupCode":"GP43"},{"id":"3cdca26f-793f-43c3-9197-3c29c94d3de9","AccountGroupName":"Depreciation","AccountGroupID":54,"GroupCode":"GP55"},{"id":"5308087f-f43b-4bed-9d58-00339fca083c","AccountGroupName":"Deposits","AccountGroupID":18,"GroupCode":"GP19"},{"id":"12b9a774-ce31-4f17-a2db-479037c6d1bf","AccountGroupName":"Current Liabilitis & Provisions","AccountGroupID":23,"GroupCode":"GP24"},{"id":"e0330e86-9a46-40ec-a885-8a4b477a81d5","AccountGroupName":"Current Assets","AccountGroupID":5,"GroupCode":"GP6"},{"id":"94cff950-269f-4269-8216-5da3cc24ca23","AccountGroupName":"Commission Receive","AccountGroupID":93,"GroupCode":"GP94"},{"id":"8a87202f-c3c4-4240-b749-7f7f51d829a8","AccountGroupName":"Commission Charges","AccountGroupID":53,"GroupCode":"GP54"},{"id":"48ac5ea9-227a-472d-86ed-27c52244ea7f","AccountGroupName":"Closing Stock","AccountGroupID":16,"GroupCode":"GP17"},{"id":"72c12e3c-7dc5-4662-8431-2a131d740b66","AccountGroupName":"Cash in Hand","AccountGroupID":9,"GroupCode":"GP10"},{"id":"c85450ef-ac08-4c46-952e-fd36e7cb9184","AccountGroupName":"Carriage Outward","AccountGroupID":72,"GroupCode":"GP73"},{"id":"57393bc6-976d-4e6c-abfd-8ca5493ad0ed","AccountGroupName":"Carriage Inward","AccountGroupID":44,"GroupCode":"GP45"},{"id":"68d92537-abd4-4434-95f9-dd25d03f21b2","AccountGroupName":"Capital","AccountGroupID":37,"GroupCode":"GP38"},{"id":"3b17cf94-ad45-41c2-8b92-1798ed24d89b","AccountGroupName":"Banks","AccountGroupID":8,"GroupCode":"GP9"},{"id":"99279e22-eee1-49cf-91b8-045226be22b6","AccountGroupName":"Bank Overdraft","AccountGroupID":28,"GroupCode":"GP29"},{"id":"d4163eb7-d928-470e-bf1b-8a92c70bb67f","AccountGroupName":"Bank Charge","AccountGroupID":91,"GroupCode":"GP92"},{"id":"e6839d02-101d-46ac-900a-042dee0b007e","AccountGroupName":"Balance Sheet","AccountGroupID":1,"GroupCode":"GP2"},{"id":"1eb271dd-6db8-457b-bb41-17ba6b8b1760","AccountGroupName":"Bad Debts","AccountGroupID":52,"GroupCode":"GP53"},{"id":"576ce16a-bfff-4446-8ebb-ba1100e3f8ef","AccountGroupName":"Assets","AccountGroupID":3,"GroupCode":"GP4"},{"id":"f61c16b1-bda1-4b98-af43-8a540e6bb7e1","AccountGroupName":"Advertisement","AccountGroupID":51,"GroupCode":"GP52"},{"id":"53076f72-52cb-4228-8f11-e436acf3d98f","AccountGroupName":"Advances","AccountGroupID":17,"GroupCode":"GP18"},{"id":"f67f61f1-9fee-4c18-9cc5-a80c5f185e4f","AccountGroupName":"Administrative Expenses","AccountGroupID":50,"GroupCode":"GP51"},{"id":"99bf2be7-fa4f-4ac3-a940-ca811b54c6b0","AccountGroupName":"Additional tax  Receivable","AccountGroupID":94,"GroupCode":"GP95"},{"id":"7b3dfe5c-105c-4bd8-a985-8a34b33c78d4","AccountGroupName":"Additional Tax Payable","AccountGroupID":89,"GroupCode":"GP90"},{"id":"fb3ff85d-d567-4b57-b61a-acdceaffe80e","AccountGroupName":"Account","AccountGroupID":0,"GroupCode":"GP1"}]

LedgerGroupListModelClass ledgerGroupListModelClassFromJson(String str) => LedgerGroupListModelClass.fromJson(json.decode(str));
String ledgerGroupListModelClassToJson(LedgerGroupListModelClass data) => json.encode(data.toJson());
class LedgerGroupListModelClass {
  LedgerGroupListModelClass({
      num? statusCode, 
      String? message, 
      List<Data>? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  LedgerGroupListModelClass.fromJson(dynamic json) {
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
LedgerGroupListModelClass copyWith({  num? statusCode,
  String? message,
  List<Data>? data,
}) => LedgerGroupListModelClass(  statusCode: statusCode ?? _statusCode,
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

/// id : "17d2ba7a-5743-45ec-a8e0-02aea4f17339"
/// AccountGroupName : "Wages"
/// AccountGroupID : 90
/// GroupCode : "GP91"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? accountGroupName, 
      num? accountGroupID, 
      String? groupCode,}){
    _id = id;
    _accountGroupName = accountGroupName;
    _accountGroupID = accountGroupID;
    _groupCode = groupCode;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _accountGroupName = json['AccountGroupName'];
    _accountGroupID = json['AccountGroupID'];
    _groupCode = json['GroupCode'];
  }
  String? _id;
  String? _accountGroupName;
  num? _accountGroupID;
  String? _groupCode;
Data copyWith({  String? id,
  String? accountGroupName,
  num? accountGroupID,
  String? groupCode,
}) => Data(  id: id ?? _id,
  accountGroupName: accountGroupName ?? _accountGroupName,
  accountGroupID: accountGroupID ?? _accountGroupID,
  groupCode: groupCode ?? _groupCode,
);
  String? get id => _id;
  String? get accountGroupName => _accountGroupName;
  num? get accountGroupID => _accountGroupID;
  String? get groupCode => _groupCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['AccountGroupName'] = _accountGroupName;
    map['AccountGroupID'] = _accountGroupID;
    map['GroupCode'] = _groupCode;
    return map;
  }

}