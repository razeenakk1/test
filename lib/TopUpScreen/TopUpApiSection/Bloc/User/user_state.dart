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
