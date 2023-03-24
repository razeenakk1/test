part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryListLoading extends CategoryState {}
class CategoryListLoaded extends CategoryState {}
class CategoryListError extends CategoryState {}
class CategoryCreateLoading extends CategoryState {}
class CategoryCreateLoaded extends CategoryState {}
class CategoryCreateError extends CategoryState {}
class CategorySingleViewLoading extends CategoryState {}
class CategorySingleViewLoaded extends CategoryState {}
class CategorySingleViewError extends CategoryState {}
class CategoryEditLoading extends CategoryState {}
class CategoryEditLoaded extends CategoryState {}
class CategoryEditError extends CategoryState {}
class CategoryDeleteLoading extends CategoryState {}
class CategoryDeleteLoaded extends CategoryState {}
class CategoryDeleteError extends CategoryState {}
