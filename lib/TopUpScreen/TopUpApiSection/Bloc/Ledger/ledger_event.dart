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
      {required this.ledgerName,
      required this.accountGroupUnder,
      required this.openingBalance,
      required this.asnDate,
      required this.address,
      required this.phone,
      required this.email,
      required this.isVat,
      required this.vatNo,
      required this.areaId});
}

class DeleteLedgerEvent extends LedgerEvent {
  final String id;

  DeleteLedgerEvent({required this.id});
}

class SingleViewLedgerEvent extends LedgerEvent {
  final String id;

  SingleViewLedgerEvent({required this.id});
}

class EditLedgerEvent extends LedgerEvent {
  final String ledgerId;
  final String ledgerName;
  final String balance;
  final String asOnDate;
  final String address;
  final String phone;
  final String email;
  final bool isVat;
  final String vatNo;
  final String areaID;
  final int partyID;

  EditLedgerEvent(
      {required this.ledgerId,
      required this.ledgerName,
      required this.balance,
      required this.asOnDate,
      required this.address,
      required this.phone,
      required this.email,
      required this.isVat,
      required this.vatNo,
      required this.areaID,
      required this.partyID});
}
/// address event section
class CreateAddressEvent extends LedgerEvent {
  final String areaId ;
  final String ledgerId ;
  final String home;
  final String address;

  CreateAddressEvent({required this.areaId,required this.ledgerId,required this.home,required this.address});

}

class DefaultAddressEvent extends LedgerEvent {
  final String addressId ;
  final bool isDefault;

  DefaultAddressEvent({required this.addressId,required this.isDefault});
}
class DeleteAddressEvent extends LedgerEvent {
  final String addressId ;


  DeleteAddressEvent({required this.addressId});


}
class SingleViewAddressEvent extends LedgerEvent {
  final String addressId ;


  SingleViewAddressEvent({required this.addressId});


}
class EditAddressEvent extends LedgerEvent {
  final String addressId;
  final String areasId; final String addressName; final String address;


  EditAddressEvent({ required  this.areasId,required this.addressName,required this.address, required this.addressId});


}
class ListAddressEvent extends LedgerEvent {
  final String search ;


  ListAddressEvent({required this.search});


}
