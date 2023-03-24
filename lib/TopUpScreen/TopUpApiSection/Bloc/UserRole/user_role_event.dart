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
