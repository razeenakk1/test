import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/UserRoleApi/userole_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/DeleteUseroleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/EditUseroleModleClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/SingleViewUseroleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/UserRoleListModelClass.dart';

part 'user_role_event.dart';
part 'user_role_state.dart';

class UserRoleBloc extends Bloc<UserRoleEvent, UserRoleState> {

  late  UserRoleListModelClass userRoleListModelClass;
  late  CreateUserRoleModelClass createUserRoleModelClass;
  late SingleViewUseroleModelClass singleViewUseroleModelClass ;
  late  EditUseroleModleClass editUseroleModelClass ;
  late  DeleteUseroleModelClass deleteUseroleModelClass;
  UserRoleApi userRoleApi;
  UserRoleBloc(this.userRoleApi) : super(UserRoleInitial()) {
    on<UserRoleListEvent>((event, emit)async {
     emit(UserRoleListLoading());
     try{
       userRoleListModelClass = await userRoleApi.listUseroleFunction(search: event.search);
       emit(UserRoleListLoaded());
     }catch(e){
       emit(UserRoleListError());
       print("-----------------listUserRoleBlocCatchError $e");

     }
    });

    on<UserRoleCreateEvent>((event, emit)async {
      emit(UserRoleCreateLoading());
      try{
        createUserRoleModelClass =await userRoleApi.createUserRoleFunction(userRoleName: event.userRoleName,
            isSale: event.isSale, isPurchase: event.isPurchase, isReports: event.isReports, isStockUpdate: event.isStockUpdate);

        emit(UserRoleCreateLoaded());
      }catch(e){
        emit(UserRoleCreateError());
        print("-----------------createUserRoleBlocCatchError $e");

      }
    });

    on<SingleViewUseroleEvent>((event, emit)async {
      emit(UserRoleSingleViewLoading());
      try{
        singleViewUseroleModelClass = await userRoleApi.singleViewUseroleFunction(id: event.id);
        emit(UserRoleSingleViewLoaded());

      }catch(e){
        emit(UserRoleSingleViewError());
        print("-----------------singleViewUseroleBlocCatchError $e");


      }
    });
    on<EditUseroleEvent>((event, emit)async {
      emit(UserRoleEditLoading());
      try{
        editUseroleModelClass = await userRoleApi.editUseroleFunction(id: event.id, useroleName:event. useroleName, isSale: event.isSale, isPurchase:  event.isPurchase, isReports:  event.isReports, isStockUpdate:  event.isStockUpdate);
        emit(UserRoleEditLoaded());

      }catch(e){
        emit(UserRoleEditError());
        print("-----------------editUseroleBlocCatchError $e");


      }
    });



    on<DeleteUseroleEvent>((event, emit)async {
      emit(UserRoleDeleteLoading());
      try{
        deleteUseroleModelClass = await userRoleApi.deleteUseroleFunction(id: event.id);

        emit(UserRoleDeleteLoaded());

      }catch(e){
        emit(UserRoleDeleteError());
        print("-----------------deleteUseroleBlocCatchError $e");


      }
    });



  }
}
