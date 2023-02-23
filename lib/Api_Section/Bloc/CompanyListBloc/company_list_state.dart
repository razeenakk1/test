part of 'company_list_bloc.dart';

@immutable
abstract class CompanyListState {}

class CompanyListInitial extends CompanyListState {}
class CompanyListLoading extends CompanyListState {}
class CompanyListLoaded extends CompanyListState {}
class CompanyListError extends CompanyListState {}
