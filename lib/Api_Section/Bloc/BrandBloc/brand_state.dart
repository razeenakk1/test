part of 'brand_bloc.dart';

@immutable
abstract class BrandState {}
// Create Brand State
class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandLoaded extends BrandState {}

class BrandError extends BrandState {}
// Delete Brand State


class DeleteLoading extends BrandState {}

class DeleteLoaded extends BrandState {}

class DeleteError extends BrandState {}



class SingleViewLoading extends BrandState {}

class SingleViewLoaded extends BrandState {}

class SingleViewError extends BrandState {}
