import 'dart:convert';
/// StatusCode : 6000
/// data : [{"id":"7376c57e-d91e-4740-9893-4ce7732f4cc2","PaymentDetailsID":5,"BranchID":1,"Action":"A","PaymentMasterID":5,"PaymentGateway":6,"RefferenceNo":"0","CardNetwork":0,"PaymentStatus":0,"DueDate":"2023-05-08","LedgerID":46887,"Amount":233.0,"Balance":26.0,"Discount":0.0,"NetAmount":233.0,"Narration":"","CreatedDate":"2023-05-08T10:50:27.031142","UpdatedDate":"2023-05-08T10:50:27.031142","CreatedUserID":62,"PaymentGatewayName":"Cash","CardNetworkName":"","PaymentStatusName":"","LedgerName":"Navas  supplier","detailID":0,"LedgerList_detail":[{"LedgerName":"Navas  supplier","LedgerID":46887}],"LedgerIDVal":"Navas  supplier","MasterUid":"5939c190-fee4-49ab-a7c4-7f2d7112be9b","MasterVoucherNo":"PT0016","Masterdate":"2023-05-08","MasterLedgerName":"Cash In Hand","MasterVoucherType":"CP","MasterNotes":""},{"id":"4896ba2c-8ae9-415d-a295-122b2613f187","PaymentDetailsID":4,"BranchID":1,"Action":"A","PaymentMasterID":4,"PaymentGateway":6,"RefferenceNo":"0","CardNetwork":0,"PaymentStatus":0,"DueDate":"2023-05-08","LedgerID":46891,"Amount":3.0,"Balance":66.0,"Discount":0.0,"NetAmount":3.0,"Narration":"","CreatedDate":"2023-05-08T10:50:22.421892","UpdatedDate":"2023-05-08T10:50:22.421892","CreatedUserID":62,"PaymentGatewayName":"Cash","CardNetworkName":"","PaymentStatusName":"","LedgerName":"Anushree  supplier","detailID":0,"LedgerList_detail":[{"LedgerName":"Anushree  supplier","LedgerID":46891}],"LedgerIDVal":"Anushree  supplier","MasterUid":"ef13c155-436f-418f-8444-9405a766b603","MasterVoucherNo":"PT0015","Masterdate":"2023-05-08","MasterLedgerName":"Cash In Hand","MasterVoucherType":"CP","MasterNotes":""}]
/// count : 5

Pymntmodel pymntmodelFromJson(String str) => Pymntmodel.fromJson(json.decode(str));
String pymntmodelToJson(Pymntmodel data) => json.encode(data.toJson());
class Pymntmodel {
  Pymntmodel({
      int? statusCode, 
      List<Data>? data, 
      int? count,}){
    _statusCode = statusCode;
    _data = data;
    _count = count;
}

  Pymntmodel.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _count = json['count'];
  }
  int? _statusCode;
  List<Data>? _data;
  int? _count;
Pymntmodel copyWith({  int? statusCode,
  List<Data>? data,
  int? count,
}) => Pymntmodel(  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
  count: count ?? _count,
);
  int? get statusCode => _statusCode;
  List<Data>? get data => _data;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// id : "7376c57e-d91e-4740-9893-4ce7732f4cc2"
/// PaymentDetailsID : 5
/// BranchID : 1
/// Action : "A"
/// PaymentMasterID : 5
/// PaymentGateway : 6
/// RefferenceNo : "0"
/// CardNetwork : 0
/// PaymentStatus : 0
/// DueDate : "2023-05-08"
/// LedgerID : 46887
/// Amount : 233.0
/// Balance : 26.0
/// Discount : 0.0
/// NetAmount : 233.0
/// Narration : ""
/// CreatedDate : "2023-05-08T10:50:27.031142"
/// UpdatedDate : "2023-05-08T10:50:27.031142"
/// CreatedUserID : 62
/// PaymentGatewayName : "Cash"
/// CardNetworkName : ""
/// PaymentStatusName : ""
/// LedgerName : "Navas  supplier"
/// detailID : 0
/// LedgerList_detail : [{"LedgerName":"Navas  supplier","LedgerID":46887}]
/// LedgerIDVal : "Navas  supplier"
/// MasterUid : "5939c190-fee4-49ab-a7c4-7f2d7112be9b"
/// MasterVoucherNo : "PT0016"
/// Masterdate : "2023-05-08"
/// MasterLedgerName : "Cash In Hand"
/// MasterVoucherType : "CP"
/// MasterNotes : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      int? paymentDetailsID, 
      int? branchID, 
      String? action, 
      int? paymentMasterID, 
      int? paymentGateway, 
      String? refferenceNo, 
      int? cardNetwork, 
      int? paymentStatus, 
      String? dueDate, 
      int? ledgerID, 
      double? amount, 
      double? balance, 
      double? discount, 
      double? netAmount, 
      String? narration, 
      String? createdDate, 
      String? updatedDate, 
      int? createdUserID, 
      String? paymentGatewayName, 
      String? cardNetworkName, 
      String? paymentStatusName, 
      String? ledgerName, 
      int? detailID, 
      List<LedgerListDetail>? ledgerListDetail,
      String? ledgerIDVal, 
      String? masterUid, 
      String? masterVoucherNo, 
      String? masterdate, 
      String? masterLedgerName, 
      String? masterVoucherType, 
      String? masterNotes,}){
    _id = id;
    _paymentDetailsID = paymentDetailsID;
    _branchID = branchID;
    _action = action;
    _paymentMasterID = paymentMasterID;
    _paymentGateway = paymentGateway;
    _refferenceNo = refferenceNo;
    _cardNetwork = cardNetwork;
    _paymentStatus = paymentStatus;
    _dueDate = dueDate;
    _ledgerID = ledgerID;
    _amount = amount;
    _balance = balance;
    _discount = discount;
    _netAmount = netAmount;
    _narration = narration;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _createdUserID = createdUserID;
    _paymentGatewayName = paymentGatewayName;
    _cardNetworkName = cardNetworkName;
    _paymentStatusName = paymentStatusName;
    _ledgerName = ledgerName;
    _detailID = detailID;
    _ledgerListDetail = ledgerListDetail;
    _ledgerIDVal = ledgerIDVal;
    _masterUid = masterUid;
    _masterVoucherNo = masterVoucherNo;
    _masterdate = masterdate;
    _masterLedgerName = masterLedgerName;
    _masterVoucherType = masterVoucherType;
    _masterNotes = masterNotes;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _paymentDetailsID = json['PaymentDetailsID'];
    _branchID = json['BranchID'];
    _action = json['Action'];
    _paymentMasterID = json['PaymentMasterID'];
    _paymentGateway = json['PaymentGateway'];
    _refferenceNo = json['RefferenceNo'];
    _cardNetwork = json['CardNetwork'];
    _paymentStatus = json['PaymentStatus'];
    _dueDate = json['DueDate'];
    _ledgerID = json['LedgerID'];
    _amount = json['Amount'];
    _balance = json['Balance'];
    _discount = json['Discount'];
    _netAmount = json['NetAmount'];
    _narration = json['Narration'];
    _createdDate = json['CreatedDate'];
    _updatedDate = json['UpdatedDate'];
    _createdUserID = json['CreatedUserID'];
    _paymentGatewayName = json['PaymentGatewayName'];
    _cardNetworkName = json['CardNetworkName'];
    _paymentStatusName = json['PaymentStatusName'];
    _ledgerName = json['LedgerName'];
    _detailID = json['detailID'];
    if (json['LedgerList_detail'] != null) {
      _ledgerListDetail = [];
      json['LedgerList_detail'].forEach((v) {
        _ledgerListDetail?.add(LedgerListDetail.fromJson(v));

      });
    }
    _ledgerIDVal = json['LedgerIDVal'];
    _masterUid = json['MasterUid'];
    _masterVoucherNo = json['MasterVoucherNo'];
    _masterdate = json['Masterdate'];
    _masterLedgerName = json['MasterLedgerName'];
    _masterVoucherType = json['MasterVoucherType'];
    _masterNotes = json['MasterNotes'];
  }
  String? _id;
  int? _paymentDetailsID;
  int? _branchID;
  String? _action;
  int? _paymentMasterID;
  int? _paymentGateway;
  String? _refferenceNo;
  int? _cardNetwork;
  int? _paymentStatus;
  String? _dueDate;
  int? _ledgerID;
  double? _amount;
  double? _balance;
  double? _discount;
  double? _netAmount;
  String? _narration;
  String? _createdDate;
  String? _updatedDate;
  int? _createdUserID;
  String? _paymentGatewayName;
  String? _cardNetworkName;
  String? _paymentStatusName;
  String? _ledgerName;
  int? _detailID;
  List<LedgerListDetail>? _ledgerListDetail;
  String? _ledgerIDVal;
  String? _masterUid;
  String? _masterVoucherNo;
  String? _masterdate;
  String? _masterLedgerName;
  String? _masterVoucherType;
  String? _masterNotes;
Data copyWith({  String? id,
  int? paymentDetailsID,
  int? branchID,
  String? action,
  int? paymentMasterID,
  int? paymentGateway,
  String? refferenceNo,
  int? cardNetwork,
  int? paymentStatus,
  String? dueDate,
  int? ledgerID,
  double? amount,
  double? balance,
  double? discount,
  double? netAmount,
  String? narration,
  String? createdDate,
  String? updatedDate,
  int? createdUserID,
  String? paymentGatewayName,
  String? cardNetworkName,
  String? paymentStatusName,
  String? ledgerName,
  int? detailID,
  List<LedgerListDetail>? ledgerListDetail,
  String? ledgerIDVal,
  String? masterUid,
  String? masterVoucherNo,
  String? masterdate,
  String? masterLedgerName,
  String? masterVoucherType,
  String? masterNotes,
}) => Data(  id: id ?? _id,
  paymentDetailsID: paymentDetailsID ?? _paymentDetailsID,
  branchID: branchID ?? _branchID,
  action: action ?? _action,
  paymentMasterID: paymentMasterID ?? _paymentMasterID,
  paymentGateway: paymentGateway ?? _paymentGateway,
  refferenceNo: refferenceNo ?? _refferenceNo,
  cardNetwork: cardNetwork ?? _cardNetwork,
  paymentStatus: paymentStatus ?? _paymentStatus,
  dueDate: dueDate ?? _dueDate,
  ledgerID: ledgerID ?? _ledgerID,
  amount: amount ?? _amount,
  balance: balance ?? _balance,
  discount: discount ?? _discount,
  netAmount: netAmount ?? _netAmount,
  narration: narration ?? _narration,
  createdDate: createdDate ?? _createdDate,
  updatedDate: updatedDate ?? _updatedDate,
  createdUserID: createdUserID ?? _createdUserID,
  paymentGatewayName: paymentGatewayName ?? _paymentGatewayName,
  cardNetworkName: cardNetworkName ?? _cardNetworkName,
  paymentStatusName: paymentStatusName ?? _paymentStatusName,
  ledgerName: ledgerName ?? _ledgerName,
  detailID: detailID ?? _detailID,
  ledgerListDetail: ledgerListDetail ?? _ledgerListDetail,
  ledgerIDVal: ledgerIDVal ?? _ledgerIDVal,
  masterUid: masterUid ?? _masterUid,
  masterVoucherNo: masterVoucherNo ?? _masterVoucherNo,
  masterdate: masterdate ?? _masterdate,
  masterLedgerName: masterLedgerName ?? _masterLedgerName,
  masterVoucherType: masterVoucherType ?? _masterVoucherType,
  masterNotes: masterNotes ?? _masterNotes,
);
  String? get id => _id;
  int? get paymentDetailsID => _paymentDetailsID;
  int? get branchID => _branchID;
  String? get action => _action;
  int? get paymentMasterID => _paymentMasterID;
  int? get paymentGateway => _paymentGateway;
  String? get refferenceNo => _refferenceNo;
  int? get cardNetwork => _cardNetwork;
  int? get paymentStatus => _paymentStatus;
  String? get dueDate => _dueDate;
  int? get ledgerID => _ledgerID;
  double? get amount => _amount;
  double? get balance => _balance;
  double? get discount => _discount;
  double? get netAmount => _netAmount;
  String? get narration => _narration;
  String? get createdDate => _createdDate;
  String? get updatedDate => _updatedDate;
  int? get createdUserID => _createdUserID;
  String? get paymentGatewayName => _paymentGatewayName;
  String? get cardNetworkName => _cardNetworkName;
  String? get paymentStatusName => _paymentStatusName;
  String? get ledgerName => _ledgerName;
  int? get detailID => _detailID;
  List<LedgerListDetail>? get ledgerListDetail => _ledgerListDetail;
  String? get ledgerIDVal => _ledgerIDVal;
  String? get masterUid => _masterUid;
  String? get masterVoucherNo => _masterVoucherNo;
  String? get masterdate => _masterdate;
  String? get masterLedgerName => _masterLedgerName;
  String? get masterVoucherType => _masterVoucherType;
  String? get masterNotes => _masterNotes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['PaymentDetailsID'] = _paymentDetailsID;
    map['BranchID'] = _branchID;
    map['Action'] = _action;
    map['PaymentMasterID'] = _paymentMasterID;
    map['PaymentGateway'] = _paymentGateway;
    map['RefferenceNo'] = _refferenceNo;
    map['CardNetwork'] = _cardNetwork;
    map['PaymentStatus'] = _paymentStatus;
    map['DueDate'] = _dueDate;
    map['LedgerID'] = _ledgerID;
    map['Amount'] = _amount;
    map['Balance'] = _balance;
    map['Discount'] = _discount;
    map['NetAmount'] = _netAmount;
    map['Narration'] = _narration;
    map['CreatedDate'] = _createdDate;
    map['UpdatedDate'] = _updatedDate;
    map['CreatedUserID'] = _createdUserID;
    map['PaymentGatewayName'] = _paymentGatewayName;
    map['CardNetworkName'] = _cardNetworkName;
    map['PaymentStatusName'] = _paymentStatusName;
    map['LedgerName'] = _ledgerName;
    map['detailID'] = _detailID;
    if (_ledgerListDetail != null) {
      map['LedgerList_detail'] = _ledgerListDetail?.map((v) => v.toJson()).toList();
    }
    map['LedgerIDVal'] = _ledgerIDVal;
    map['MasterUid'] = _masterUid;
    map['MasterVoucherNo'] = _masterVoucherNo;
    map['Masterdate'] = _masterdate;
    map['MasterLedgerName'] = _masterLedgerName;
    map['MasterVoucherType'] = _masterVoucherType;
    map['MasterNotes'] = _masterNotes;
    return map;
  }

}

/// LedgerName : "Navas  supplier"
/// LedgerID : 46887

LedgerListDetail ledgerListDetailFromJson(String str) => LedgerListDetail.fromJson(json.decode(str));
String ledgerListDetailToJson(LedgerListDetail data) => json.encode(data.toJson());
class LedgerListDetail {
  LedgerListDetail({
      String? ledgerName, 
      int? ledgerID,}){
    _ledgerName = ledgerName;
    _ledgerID = ledgerID;
}

  LedgerListDetail.fromJson(dynamic json) {
    _ledgerName = json['LedgerName'];
    _ledgerID = json['LedgerID'];
  }
  String? _ledgerName;
  int? _ledgerID;
LedgerListDetail copyWith({  String? ledgerName,
  int? ledgerID,
}) => LedgerListDetail(  ledgerName: ledgerName ?? _ledgerName,
  ledgerID: ledgerID ?? _ledgerID,
);
  String? get ledgerName => _ledgerName;
  int? get ledgerID => _ledgerID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LedgerName'] = _ledgerName;
    map['LedgerID'] = _ledgerID;
    return map;
  }

}