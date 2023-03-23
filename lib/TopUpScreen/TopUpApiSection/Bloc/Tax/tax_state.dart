part of 'tax_bloc.dart';

@immutable
abstract class TaxState {}

class TaxInitial extends TaxState {}
class TaxCreateLoading extends TaxState {}
class TaxCreateLoaded extends TaxState {}
class TaxCreateError extends TaxState {}
class TaxListLoading extends TaxState {}
class TaxListLoaded extends TaxState {}
class TaxListError extends TaxState {}
class SingleViewTaxListLoading extends TaxState {}
class SingleViewTaxListLoaded extends TaxState {}
class SingleViewTaxListError extends TaxState {}
class EditTaxLoading extends TaxState {}
class EditTaxLoaded extends TaxState {}
class EditTaxError extends TaxState {}
class DeleteTaxLoading extends TaxState {}
class DeleteTaxLoaded extends TaxState {}
class DeleteTaxError extends TaxState {
  final String msg;

  DeleteTaxError({required this.msg});
}
