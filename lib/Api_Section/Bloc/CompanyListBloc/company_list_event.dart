part of 'company_list_bloc.dart';

@immutable
abstract class CompanyListEvent {}
class FetchCompanyEvent extends CompanyListEvent{
  final String userId;
  final bool isMobile;

  FetchCompanyEvent({required this.userId, required this.isMobile});


}
