part of 'brand_name_bloc.dart';

@immutable
abstract class BrandNameState {}

class BrandNameInitial extends BrandNameState {}
class BrandNameLoading extends BrandNameState {}
class BrandNameLoaded extends BrandNameState {}
class BrandNameError extends BrandNameState {}
