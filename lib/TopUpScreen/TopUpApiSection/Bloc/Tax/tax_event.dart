part of 'tax_bloc.dart';

@immutable
abstract class TaxEvent {}
class CreateTaxEvent extends TaxEvent {
  final String texName;
  final String purchaseTax;
  final String saleTax;

  CreateTaxEvent({required this.texName,required this.purchaseTax,required this.saleTax});

}
class ListTaxEvent extends TaxEvent {}
class SingleViewTaxEvent extends TaxEvent {
  final String id;
  SingleViewTaxEvent({required this.id});
}
