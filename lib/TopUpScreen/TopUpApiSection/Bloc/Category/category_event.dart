part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}
class ListCategoryEvent extends CategoryEvent {
  final String search;

  ListCategoryEvent({required this.search});
}
class CreateCategoryEvent extends CategoryEvent {
  final String categoryName;

  CreateCategoryEvent({required this.categoryName});
}
class SingleViewCategoryEvent extends CategoryEvent{
  final String id;

  SingleViewCategoryEvent({required this.id});
}



class EditCategoryEvent extends CategoryEvent{
  final String id;
  final String categoryName;

  EditCategoryEvent({required this.id, required this.categoryName});
}
class DeleteCategoryEvent extends CategoryEvent{
  final String id;

  DeleteCategoryEvent({required this.id});



}