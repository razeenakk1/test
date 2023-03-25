import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/UserListModelClass.dart';

import '../../Api Function/User/UserApi.dart';
import '../../ModelClasses/User/CreateUserModelClass.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late CreateUserModelClass createUserModelClass;
  late UserListModelClass userListModelClass;
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
        emit(UserListError());
        print("-----------------ListBlocCatchError $e");
      }
    });
  }
}
