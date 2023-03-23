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
