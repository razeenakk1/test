part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class FetchLogin extends LoginEvent{
  final String username;
  final String password;
  final  String service;
  FetchLogin({required this.username,required this.password,required this.service});
}
