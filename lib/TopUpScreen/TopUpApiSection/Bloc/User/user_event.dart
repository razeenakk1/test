part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}
class CreateUserEvent extends UserEvent {
  final String firstName;
  final String username;
  final String email;
  final String password1;
  final String password2;
  final String phone;
  final String userRoles;
  final bool isAdmin;

  CreateUserEvent(
      {required this.firstName,
      required this.username,
      required this.email,
      required this.password1,
      required this.password2,
      required this.phone,
      required this.userRoles,
      required this.isAdmin});


}
class ListUserEvent extends UserEvent {
  final String search;

  ListUserEvent({required this.search});


}
