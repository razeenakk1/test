part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}
class ListGroupEvent extends GroupEvent {
  final String search;

  ListGroupEvent({required this.search});
}



class CreateGroupEvent extends GroupEvent {
  final String productGroupName;

  CreateGroupEvent({required this.productGroupName});
}
class SingleViewGroupEvent extends GroupEvent{
  final String id;

  SingleViewGroupEvent({required this.id});
}



class EditGroupEvent extends GroupEvent{
  final String id;
  final String productGroupName;

  EditGroupEvent({required this.id, required this.productGroupName});
}
class DeleteGroupEvent extends GroupEvent {
  final String id;

  DeleteGroupEvent({required this.id});
}


