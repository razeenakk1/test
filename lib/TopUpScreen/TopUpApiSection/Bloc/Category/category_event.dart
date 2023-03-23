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
