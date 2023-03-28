part of 'ledger_bloc.dart';

@immutable
abstract class LedgerEvent {}
class ListLedgerEvent extends LedgerEvent {
  final String search;

  ListLedgerEvent({required this.search});}
class ListLedgerGroupEvent extends LedgerEvent {
  final String search;

  ListLedgerGroupEvent({required this.search});}
