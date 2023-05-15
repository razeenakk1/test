

class PaymentDetailModelClass{
  String id, date, ledgerName,Balance,PaymentStatusName;
  int PaymentDetailsID , branchId;
   var list ;
  PaymentDetailModelClass({
        required this.id,
        required this.PaymentStatusName,
        required this.Balance,
        required this.ledgerName,
        required this.date,
        required this.PaymentDetailsID,
        required this.branchId,
      required this.list
      });
  factory PaymentDetailModelClass.fromJson(Map<dynamic , dynamic>json){
    return PaymentDetailModelClass(
        id: json['id'],
        Balance: json['Balance'].toString(),
        ledgerName: json['LedgerName'],
        date: json['DueDate'],
        PaymentDetailsID: json['PaymentDetailsID'],
        branchId: json['BranchID'],
        list: json['LedgerList_detail'].toString(),
        PaymentStatusName: json['PaymentStatusName']??"");
  }
}



























