part of 'group_bloc.dart';

@immutable
abstract class GroupState {}

class GroupInitial extends GroupState {}
class GroupListLoading extends GroupState {}
class GroupListLoaded extends GroupState {}
class GroupListError extends GroupState {}
class GroupCreateLoading extends GroupState {}
class GroupCreateLoaded extends GroupState {}
class GroupCreateError extends GroupState {}
class GroupSingleViewLoading extends GroupState {}
class GroupSingleViewLoaded extends GroupState {}
class GroupSingleViewError extends GroupState {}
class GroupEditLoading extends GroupState {}
class GroupEditLoaded extends GroupState {}
class GroupEditError extends GroupState {}
class GroupDeleteLoading extends GroupState {}
class GroupDeleteLoaded extends GroupState {}
class GroupDeleteError extends GroupState {}

