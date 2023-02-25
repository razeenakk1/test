part of 'get_bloc.dart';

@immutable
abstract class GetState {}

class GetInitial extends GetState {}
class GetLoading extends GetState {}
class GetLoaded extends GetState {}
class GetError extends GetState {}
