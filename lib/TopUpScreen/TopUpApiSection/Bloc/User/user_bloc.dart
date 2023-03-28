import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/DeleteUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/EditUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/SingleViewUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/UserListModelClass.dart';

import '../../Api Function/User/UserApi.dart';
import '../../ModelClasses/User/CreateUserModelClass.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late CreateUserModelClass createUserModelClass;
  late UserListModelClass userListModelClass;
 late SingleViewUserModelClass  singleViewUserModelClass ;
  late EditUserModelClass editUserModelClass ;
  late  DeleteUserModelClass deleteUserModelClass ;
  ApiUser apiUser;
  UserBloc(this.apiUser) : super(UserInitial()) {
    on<CreateUserEvent>((event, emit) async{
      emit(UserCreateLoading());
      try{
        createUserModelClass = await apiUser.createUserFunction(firstName: event.username,
            username: event.username, email: event.email, password1: event.password1, password2: event.password2,
            phone: event.phone, userRoles: event.userRoles, isAdmin: event.isAdmin);
        emit(UserCreateLoaded());

      }catch(e){
        emit(UserCreateError());

        print("-----------------createBlocCatchError $e");}

    });
    on<ListUserEvent>((event, emit) async {
      emit(UserListLoading());
      try {
        userListModelClass = await apiUser.listUserFunction(search: event.search);
        emit(UserListLoaded());
      } catch (e) {
        print("*******************************************************************************catch error");

        emit(UserListError());

        print("-----------------*******************************UserListBlocCatchError $e");
      }
    });
    on<SingleViewUserEvent>((event, emit) async {
      emit(SingleViewUserLoading());
      try {
        singleViewUserModelClass =
        await apiUser.singleViewUserFunction(id: event.id);
        emit(SingleViewUserLoaded());
      } catch (e) {
        emit(SingleViewUserError());
        print("-----------------singleViewUserBlocCatchError $e");
      }
    });

    on<EditUserEvent>((event, emit) async {
      emit(EditUserLoading());
      try {
        editUserModelClass = await apiUser.editUserFunction(id:event.id,
            firstName: event.firstName, username: event.username, email: event.email, password1: event.password1,
            password2: event.password2, phone: event.phone, userRoles: event.userRoles, isAdmin: event.isAdmin);

        emit(EditUserLoaded());
      } catch (e) {
        emit(EditUserError());
        print("-----------------editUserBlocCatchError $e");
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      emit(DeleteUserLoading());
      try {
        deleteUserModelClass = await apiUser.deleteUserFunction(id: event.id);

        emit(DeleteUserLoaded());
      } catch (e) {
        emit(DeleteUserError());
        print("-----------------deleteUserBlocCatchError $e");
      }
    });
  }
}
