part of 'pagiantion_bloc.dart';

@immutable
abstract class PagiantionEvent {}
class GetDataEvent extends PagiantionEvent {}

class LoadPageEvent extends PagiantionEvent {

  final int pageNo;
  final int itemPerPage;

  LoadPageEvent( {required this.pageNo, required this.itemPerPage});
}

