import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/CreateGroupModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/DeleteGroupModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/EditGroupModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/SingleViewGroupModelClass.dart';

import '../../Api Function/Group/group_api.dart';
import '../../ModelClasses/Group/GroupListModelClass.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  late GroupListModelClass groupListModelClass;

  late CreateGroupModelClass createGroupModelClass;

  late SingleViewGroupModelClass singleViewGroupModelClass;

  late EditGroupModelClass editGroupModelClass;

  late DeleteGroupModelClass deleteGroupModelClass;

  GroupApi groupApi;

  GroupBloc(this.groupApi) : super(GroupInitial()) {
    on<ListGroupEvent>((event, emit) async {
      emit(GroupListLoading());
      try {
        groupListModelClass =
        await groupApi.listAndSearchGroupApiFunction(search: event.search);
        emit(GroupListLoaded());
      } catch (e) {
        emit(GroupListError());
        print("-----------------listGroupBlocCatchError $e");
      }
    });

    on<CreateGroupEvent>((event, emit) async {
      emit(GroupCreateLoading());
      try {
        createGroupModelClass = await groupApi.createGroupFunction(
            productGroupName: event.productGroupName);
        emit(GroupCreateLoaded());
      } catch (e) {
        emit(GroupCreateError());
        print("-----------------createGroupBlocCatchError $e");
      }
    });
    on<SingleViewGroupEvent>((event, emit) async {
      emit(GroupSingleViewLoading());
      try {
        singleViewGroupModelClass =
        await groupApi.singleViewGroupFunction(id: event.id);
        emit(GroupSingleViewLoaded());
      } catch (e) {
        emit(GroupSingleViewError());
        print("-----------------singleViewGroupBlocCatchError $e");
      }
    });
    on<EditGroupEvent>((event, emit) async {
      emit(GroupEditLoading());
      try {
        editGroupModelClass = await groupApi.editGroupFunction(
            id: event.id, productGroupName: event.productGroupName);
        emit(GroupEditLoaded());
      } catch (e) {
        emit(GroupEditError());
        print("-----------------editGroupBlocCatchError $e");
      }
    });


    on<DeleteGroupEvent>((event, emit) async {
      emit(GroupDeleteLoading());
      try {
        deleteGroupModelClass =
        await groupApi.deleteGroupFunction(id: event.id);

        emit(GroupDeleteLoaded());
      } catch (e) {
        emit(GroupDeleteError());
        print("-----------------deleteGroupBlocCatchError $e");
      }
    });
  }
}