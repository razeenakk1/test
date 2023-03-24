part of 'area_bloc.dart';

@immutable
abstract class AreaState {}

class AreaInitial extends AreaState {}
class AreaCreateLoading extends AreaState {}
class AreaCreateLoaded extends AreaState {}
class AreaCreateError extends AreaState {}
class AreaListLoading extends AreaState {}
class AreaListLoaded extends AreaState {}
class AreaListError extends AreaState {}
class AreaSingleViewLoading extends AreaState {}
class AreaSingleViewLoaded extends AreaState {}
class AreaSingleViewError extends AreaState {}
class AreaEditLoading extends AreaState {}
class AreaEditLoaded extends AreaState {}
class AreaEditError extends AreaState {}
class AreaDeleteLoading extends AreaState {}
class AreaDeleteLoaded extends AreaState {}
class AreaDeleteError extends AreaState {}
