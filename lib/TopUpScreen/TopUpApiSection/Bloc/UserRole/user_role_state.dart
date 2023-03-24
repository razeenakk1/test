part of 'user_role_bloc.dart';

@immutable
abstract class UserRoleState {}

class UserRoleInitial extends UserRoleState {}
class UserRoleListLoading extends UserRoleState {}
class UserRoleListLoaded extends UserRoleState {}
class UserRoleListError extends UserRoleState {}
class UserRoleListCreateLoading extends UserRoleState {}
class UserRoleListCreateLoaded extends UserRoleState {}
class UserRoleListCreateError extends UserRoleState {}

