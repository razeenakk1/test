part of 'pagiantion_bloc.dart';

@immutable
abstract class PagiantionState {}

class PagiantionInitial extends PagiantionState {}
class DataLoading extends PagiantionState {}

class DataLoaded extends PagiantionState {}

class DataLoadError extends PagiantionState {}
