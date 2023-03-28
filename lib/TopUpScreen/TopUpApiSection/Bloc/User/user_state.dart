part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserCreateLoading extends UserState {}
class UserCreateLoaded extends UserState {}
class UserCreateError extends UserState {}
class UserListLoading extends UserState {}
class UserListLoaded extends UserState {}
class UserListError extends UserState {}
class SingleViewUserLoading extends UserState {}
class SingleViewUserLoaded extends UserState {}
class SingleViewUserError extends UserState {}
class EditUserLoading extends UserState {}
class EditUserLoaded extends UserState {}
class EditUserError extends UserState {}
class DeleteUserLoading extends UserState {}
class DeleteUserLoaded extends UserState {}
class DeleteUserError extends UserState {}

