import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/UserRoleApi/userole_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/UserRoleListModelClass.dart';

part 'user_role_event.dart';
part 'user_role_state.dart';

class UserRoleBloc extends Bloc<UserRoleEvent, UserRoleState> {

  late  UserRoleListModelClass userRoleListModelClass;
  late  CreateUserRoleModelClass createUserRoleModelClass;
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
      emit(UserRoleListCreateLoading());
      try{
        createUserRoleModelClass =await userRoleApi.createUserRoleFunction(userRoleName: event.userRoleName,
            isSale: event.isSale, isPurchase: event.isPurchase, isReports: event.isReports, isStockUpdate: event.isStockUpdate);

        emit(UserRoleListCreateLoaded());
      }catch(e){
        emit(UserRoleListCreateError());
        print("-----------------createUserRoleBlocCatchError $e");

      }
    });
  }
}
