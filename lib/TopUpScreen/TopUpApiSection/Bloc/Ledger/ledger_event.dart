part of 'ledger_bloc.dart';

@immutable
abstract class LedgerEvent {}

class ListLedgerEvent extends LedgerEvent {
  final String search;

  ListLedgerEvent({required this.search});
}

class ListLedgerGroupEvent extends LedgerEvent {
  final String search;

  ListLedgerGroupEvent({required this.search});
}
class CreateLedgerEvent extends LedgerEvent {
  final String ledgerName;
  final int accountGroupUnder;
  final int openingBalance;
  final String asnDate;
  final String address;
  final String phone;
  final String email;
  final bool isVat;
  final String vatNo;
  final String areaId;

  CreateLedgerEvent(
      {required this.ledgerName, required this.accountGroupUnder, required this.openingBalance,
        required this.asnDate, required this.address, required this.phone, required this.email, required this.isVat, required this.vatNo, required this.areaId});
}
class DeleteLedgerEvent extends LedgerEvent {
  final String id;

  DeleteLedgerEvent({required this.id});
}
class SingleViewLedgerEvent extends LedgerEvent {
  final String id;

  SingleViewLedgerEvent({required this.id});
}
