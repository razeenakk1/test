part of 'user_role_bloc.dart';

@immutable
abstract class UserRoleEvent {}
class UserRoleListEvent extends UserRoleEvent {
  final String search;

  UserRoleListEvent({required this.search});
}
class UserRoleCreateEvent extends UserRoleEvent {
  final String userRoleName;
  final bool isSale;
  final bool isPurchase;
  final bool isReports;
  final bool isStockUpdate;

  UserRoleCreateEvent(
      {required this.userRoleName,
    required  this.isSale,
    required  this.isPurchase,
    required  this.isReports,
  required    this.isStockUpdate});
}
class SingleViewUseroleEvent extends UserRoleEvent{
  final String id;

  SingleViewUseroleEvent({required this.id});
}



class EditUseroleEvent extends UserRoleEvent{
  final String id;
  final String useroleName;
  final bool isSale;
  final bool isPurchase;
  final bool isReports;
  final bool isStockUpdate;

  EditUseroleEvent(
      {required this.id,
      required this.useroleName,
      required this.isSale,
      required this.isPurchase,
      required this.isReports,
      required this.isStockUpdate});


}
class DeleteUseroleEvent extends UserRoleEvent{
  final String id;

  DeleteUseroleEvent({required this.id});



}
