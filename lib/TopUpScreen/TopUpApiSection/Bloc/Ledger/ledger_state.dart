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
class EditLedgerLoading extends LedgerState {}
class EditLedgerLoaded extends LedgerState {}
class EditLedgerError extends LedgerState {}

/// Address section state;
class AddressCreateLoading extends LedgerState {}
class AddressCreateLoaded extends LedgerState {}
class AddressCreateError extends LedgerState {}
class DefaultAddressLoading extends LedgerState {}
class DefaultAddressLoaded extends LedgerState {}
class DefaultAddressError extends LedgerState {}
class DeleteAddressLoading extends LedgerState {}
class DeleteAddressLoaded extends LedgerState {}
class DeleteAddressError extends LedgerState {}
class AddressSingleViewLoading extends LedgerState {}
class AddressSingleViewLoaded extends LedgerState {}
class AddressSingleViewError extends LedgerState {}
class AddressEditLoading extends LedgerState {}
class AddressEditLoaded extends LedgerState {}
class AddressEditError extends LedgerState {}
class AddressListLoading extends LedgerState {}
class AddressListLoaded extends LedgerState {}
class AddressListError extends LedgerState {}

