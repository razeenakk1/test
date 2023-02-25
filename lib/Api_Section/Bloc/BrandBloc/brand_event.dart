part of 'brand_bloc.dart';

@immutable
abstract class BrandEvent {}

class CreateBrandEvent extends BrandEvent {
  final String note;
  final String title;
  final int branchID;
  final String companyID;
  final int createUserId;

  CreateBrandEvent(
      {required this.note,
      required this.title,
      required this.branchID,
      required this.companyID,
      required this.createUserId});
}

class DeleteMethodEvent extends BrandEvent {
  final int createUserId;
  final String companyId;
  final int branchId;

  DeleteMethodEvent(
      {required this.createUserId,
      required this.companyId,
      required this.branchId});
}
class SingleViewEvent extends BrandEvent {
 final String companyID;
 final int branchId;
 final String brandName;
 final String notes;
 final int userID;

  SingleViewEvent(
      {required this.companyID,required this.branchId,required this.brandName, required this.notes,required this.userID});

}