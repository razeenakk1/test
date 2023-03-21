part of 'top_up_login_bloc.dart';

@immutable
abstract class TopUpLoginEvent {}

class PostLoginEvent extends TopUpLoginEvent {
  final String userName;
  final String password;

  PostLoginEvent({required this.userName, required this.password});
}