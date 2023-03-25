part of 'user_role_bloc.dart';

@immutable
abstract class UserRoleState {}

class UserRoleInitial extends UserRoleState {}
class UserRoleListLoading extends UserRoleState {}
class UserRoleListLoaded extends UserRoleState {}
class UserRoleListError extends UserRoleState {}
class UserRoleCreateLoading extends UserRoleState {}
class UserRoleCreateLoaded extends UserRoleState {}
class UserRoleCreateError extends UserRoleState {}
class UserRoleSingleViewLoading extends UserRoleState {}
class UserRoleSingleViewLoaded extends UserRoleState {}
class UserRoleSingleViewError extends UserRoleState {}
class UserRoleEditLoading extends UserRoleState {}
class UserRoleEditLoaded extends UserRoleState {}
class UserRoleEditError extends UserRoleState {}
class UserRoleDeleteLoading extends UserRoleState {}
class UserRoleDeleteLoaded extends UserRoleState {}
class UserRoleDeleteError extends UserRoleState {}

