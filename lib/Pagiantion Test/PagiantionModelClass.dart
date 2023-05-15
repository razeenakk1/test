import 'dart:convert';
/// StatusCode : 6000
/// data : [{"index":0,"id":"bb57fe6c-cbcd-4c5d-bee8-e4b3823acc94","VoucherNo":"SI126","Date":"2023-04-27","LedgerName":"Cash In Hand","TotalGrossAmt_rounded":12.0,"TotalTax_rounded":0.24,"GrandTotal_Rounded":12.0,"CustomerName":"","TotalTax":0.24,"Status":"Invoiced","GrandTotal":12.0,"is_billwised":false,"billwise_status":"paid"},{"index":1,"id":"c9104185-48dd-4198-98fc-f00eeedab089","VoucherNo":"SI125","Date":"2023-04-27","LedgerName":"Cash In Hand","TotalGrossAmt_rounded":12.0,"TotalTax_rounded":0.24,"GrandTotal_Rounded":12.24,"CustomerName":"Cash In Hand","TotalTax":0.24,"Status":"Invoiced","GrandTotal":12.24,"is_billwised":false,"billwise_status":"paid"},{"index":2,"id":"0c5541d2-056b-479d-a6c1-741016127671","VoucherNo":"SI124","Date":"2023-04-27","LedgerName":"Dennis Jose","TotalGrossAmt_rounded":12.0,"TotalTax_rounded":0.24,"GrandTotal_Rounded":12.24,"CustomerName":" ","TotalTax":0.24,"Status":"Invoiced","GrandTotal":12.24,"is_billwised":false,"billwise_status":"paid"},{"index":3,"id":"a63c4fe6-180d-43f4-af54-4af850e90be7","VoucherNo":"SI123","Date":"2023-04-27","LedgerName":"Cash In Hand","TotalGrossAmt_rounded":10.0,"TotalTax_rounded":1.0,"GrandTotal_Rounded":11.0,"CustomerName":"Cash In Hand","TotalTax":1.0,"Status":"Invoiced","GrandTotal":11.0,"is_billwised":false,"billwise_status":"paid"},{"index":4,"id":"ff867e3d-d2c8-45ee-b114-f9de79ce0a5f","VoucherNo":"SI122","Date":"2023-04-25","LedgerName":"Cash In Hand","TotalGrossAmt_rounded":20.0,"TotalTax_rounded":0.0,"GrandTotal_Rounded":20.0,"CustomerName":"Cash In Hand","TotalTax":0.0,"Status":"Invoiced","GrandTotal":20.0,"is_billwised":false,"billwise_status":"paid"}]
/// total_count : 84

PagiantionModelClass pagiantionModelClassFromJson(String str) => PagiantionModelClass.fromJson(json.decode(str));
String pagiantionModelClassToJson(PagiantionModelClass data) => json.encode(data.toJson());
class PagiantionModelClass {
  PagiantionModelClass({
      int? statusCode, 
      List<Data>? data, 
      int? totalCount,}){
    _statusCode = statusCode;
    _data = data;
    _totalCount = totalCount;
}

  PagiantionModelClass.fromJson(dynamic json) {
    _statusCode = json['StatusCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  int? _statusCode;
  List<Data>? _data;
  int? _totalCount;
PagiantionModelClass copyWith({  int? statusCode,
  List<Data>? data,
  int? totalCount,
}) => PagiantionModelClass(  statusCode: statusCode ?? _statusCode,
  data: data ?? _data,
  totalCount: totalCount ?? _totalCount,
);
  int? get statusCode => _statusCode;
  List<Data>? get data => _data;
  int? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = _totalCount;
    return map;
  }

}

/// index : 0
/// id : "bb57fe6c-cbcd-4c5d-bee8-e4b3823acc94"
/// VoucherNo : "SI126"
/// Date : "2023-04-27"
/// LedgerName : "Cash In Hand"
/// TotalGrossAmt_rounded : 12.0
/// TotalTax_rounded : 0.24
/// GrandTotal_Rounded : 12.0
/// CustomerName : ""
/// TotalTax : 0.24
/// Status : "Invoiced"
/// GrandTotal : 12.0
/// is_billwised : false
/// billwise_status : "paid"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? index,
      String? id,
      String? voucherNo,
      String? date,
      String? ledgerName,
      double? totalGrossAmtRounded, 
      double? totalTaxRounded, 
      double? grandTotalRounded, 
      String? customerName,
      double? totalTax, 
      String? status,
      double? grandTotal, 
      bool? isBillwised, 
      String? billwiseStatus,}){
    _index = index;
    _id = id;
    _voucherNo = voucherNo;
    _date = date;
    _ledgerName = ledgerName;
    _totalGrossAmtRounded = totalGrossAmtRounded;
    _totalTaxRounded = totalTaxRounded;
    _grandTotalRounded = grandTotalRounded;
    _customerName = customerName;
    _totalTax = totalTax;
    _status = status;
    _grandTotal = grandTotal;
    _isBillwised = isBillwised;
    _billwiseStatus = billwiseStatus;
}

  Data.fromJson(dynamic json) {
    _index = json['index'];
    _id = json['id'];
    _voucherNo = json['VoucherNo'];
    _date = json['Date'];
    _ledgerName = json['LedgerName'];
    _totalGrossAmtRounded = json['TotalGrossAmt_rounded'];
    _totalTaxRounded = json['TotalTax_rounded'];
    _grandTotalRounded = json['GrandTotal_Rounded'];
    _customerName = json['CustomerName'];
    _totalTax = json['TotalTax'];
    _status = json['Status'];
    _grandTotal = json['GrandTotal'];
    _isBillwised = json['is_billwised'];
    _billwiseStatus = json['billwise_status'];
  }
  int? _index;
  String? _id;
  String? _voucherNo;
  String? _date;
  String? _ledgerName;
  double? _totalGrossAmtRounded;
  double? _totalTaxRounded;
  double? _grandTotalRounded;
  String? _customerName;
  double? _totalTax;
  String? _status;
  double? _grandTotal;
  bool? _isBillwised;
  String? _billwiseStatus;
Data copyWith({  int? index,
  String? id,
  String? voucherNo,
  String? date,
  String? ledgerName,
  double? totalGrossAmtRounded,
  double? totalTaxRounded,
  double? grandTotalRounded,
  String? customerName,
  double? totalTax,
  String? status,
  double? grandTotal,
  bool? isBillwised,
  String? billwiseStatus,
}) => Data(  index: index ?? _index,
  id: id ?? _id,
  voucherNo: voucherNo ?? _voucherNo,
  date: date ?? _date,
  ledgerName: ledgerName ?? _ledgerName,
  totalGrossAmtRounded: totalGrossAmtRounded ?? _totalGrossAmtRounded,
  totalTaxRounded: totalTaxRounded ?? _totalTaxRounded,
  grandTotalRounded: grandTotalRounded ?? _grandTotalRounded,
  customerName: customerName ?? _customerName,
  totalTax: totalTax ?? _totalTax,
  status: status ?? _status,
  grandTotal: grandTotal ?? _grandTotal,
  isBillwised: isBillwised ?? _isBillwised,
  billwiseStatus: billwiseStatus ?? _billwiseStatus,
);
  int? get index => _index;
  String? get id => _id;
  String? get voucherNo => _voucherNo;
  String? get date => _date;
  String? get ledgerName => _ledgerName;
  double? get totalGrossAmtRounded => _totalGrossAmtRounded;
  double? get totalTaxRounded => _totalTaxRounded;
  double? get grandTotalRounded => _grandTotalRounded;
  String? get customerName => _customerName;
  double? get totalTax => _totalTax;
  String? get status => _status;
  double? get grandTotal => _grandTotal;
  bool? get isBillwised => _isBillwised;
  String? get billwiseStatus => _billwiseStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = _index;
    map['id'] = _id;
    map['VoucherNo'] = _voucherNo;
    map['Date'] = _date;
    map['LedgerName'] = _ledgerName;
    map['TotalGrossAmt_rounded'] = _totalGrossAmtRounded;
    map['TotalTax_rounded'] = _totalTaxRounded;
    map['GrandTotal_Rounded'] = _grandTotalRounded;
    map['CustomerName'] = _customerName;
    map['TotalTax'] = _totalTax;
    map['Status'] = _status;
    map['GrandTotal'] = _grandTotal;
    map['is_billwised'] = _isBillwised;
    map['billwise_status'] = _billwiseStatus;
    return map;
  }

}