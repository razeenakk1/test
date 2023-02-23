import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:topuptest/Api_Section/All_Api/login_api.dart';
import 'package:topuptest/Api_Section/ModelClasses/LoginModelClass.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModelClass loginModelClass;
  UserApi userApi;
  LoginBloc(this.userApi) : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async {
     // SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        emit(LoginLoading());
        loginModelClass = await userApi.getLoginFunction(
            userName: event.username,
            password: event.password,
            service: event.service);

       // prefs.setString('token', "tokenss");
     //   print("________________${loginModelClass.data!.access.toString()}");
       // prefs.setString('id', "id");
      //  print("________________${ loginModelClass.data!.userId.toString()}");

        emit(LoginLoaded());
      } catch(e){
        emit(LoginError());
        print("-----------------LoginBLOc$e");
      }

      // TODO: implement event handler
    });
  }
}
