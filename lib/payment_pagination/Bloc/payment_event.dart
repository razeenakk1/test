part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}
class FetchDataEvent extends PaymentEvent {}

class LoadPageEvent extends PaymentEvent {

  final int pageNo;
  final int itemPerPage;

  LoadPageEvent( {required this.pageNo, required this.itemPerPage});
}

