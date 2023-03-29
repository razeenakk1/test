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
class LedgerCreateLoading extends LedgerState {}
class LedgerCreateLoaded extends LedgerState {}
class LedgerCreateError extends LedgerState {}
class DeleteLedgerLoading extends LedgerState {}
class DeleteLedgerLoaded extends LedgerState {}
class DeleteLedgerError extends LedgerState {}
class SingleViewLedgerLoading extends LedgerState {}
class SingleViewLedgerLoaded extends LedgerState {}
class SingleViewLedgerError extends LedgerState {}
