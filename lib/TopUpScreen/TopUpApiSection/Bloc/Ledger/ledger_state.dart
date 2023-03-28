part of 'ledger_bloc.dart';

@immutable
abstract class LedgerState {}

class LedgerInitial extends LedgerState {}
class LedgerListLoading extends LedgerState {}
class LedgerListLoaded extends LedgerState {}
class LedgerListError extends LedgerState {}
class LedgerGroupListLoading extends LedgerState {}
class LedgerGroupListLoaded extends LedgerState {}
class LedgerGroupListError extends LedgerState {}
