part of 'top_up_login_bloc.dart';

@immutable
abstract class TopUpLoginState {}

class TopUpLoginInitial extends TopUpLoginState {}
class TopUpLoginLoading extends TopUpLoginState {}
class TopUpLoginLoaded extends TopUpLoginState {}
class TopUpLoginError extends TopUpLoginState {}
