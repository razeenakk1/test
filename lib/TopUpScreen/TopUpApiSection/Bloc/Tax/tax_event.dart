part of 'tax_bloc.dart';

@immutable
abstract class TaxEvent {}
class CreateTaxEvent extends TaxEvent {
  final String texName;
  final String purchaseTax;
  final String saleTax;

  CreateTaxEvent({required this.texName,required this.purchaseTax,required this.saleTax});

}
class ListTaxEvent extends TaxEvent {
  final String search;

  ListTaxEvent({required this.search});
}
class SingleViewTaxEvent extends TaxEvent {
  final String id;
  SingleViewTaxEvent({required this.id});
}
class EditTaxEvent extends TaxEvent {
  final String id;
  final String texName;
  final String purchaseTax;
  final String saleTax;

  EditTaxEvent({required this.id,required this.texName,required this.purchaseTax,required this.saleTax});

}
class DeleteTaxEvent extends TaxEvent {
  final String id;

  DeleteTaxEvent({required this.id});



}