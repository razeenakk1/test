part of 'area_bloc.dart';

@immutable
abstract class AreaEvent {}
class CreateAreaEvent extends AreaEvent {
  final String areaName;

  CreateAreaEvent({required this.areaName});
}
class ListAreaEvent extends AreaEvent {
  final String search;

  ListAreaEvent({required this.search});
}

class SingleViewAreaEvent extends AreaEvent{
  final String id;

  SingleViewAreaEvent({required this.id});
}



class EditAreaEvent extends AreaEvent{
  final String id;
  final String areaName;

  EditAreaEvent({required this.id, required this.areaName});
}
class DeleteAreaEvent extends AreaEvent{
  final String id;

  DeleteAreaEvent({required this.id});



}
