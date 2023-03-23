import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Function/Login_Api/login_api.dart';
import '../../ModelClasses/LoginModelClass/TopUpLoginModelClass.dart';

part 'top_up_login_event.dart';
part 'top_up_login_state.dart';

class TopUpLoginBloc extends Bloc<TopUpLoginEvent, TopUpLoginState> {
  late TopUpLoginModelClass topUpLoginModelClass;
   ApiLoginTopUp apiLoginTopUp;
  TopUpLoginBloc(this.apiLoginTopUp) : super(TopUpLoginInitial()) {
    on<PostLoginEvent>((event, emit) async{
      final preference = await SharedPreferences.getInstance();
      emit(TopUpLoginLoading());
      try{
        topUpLoginModelClass = await apiLoginTopUp.loginFunction(username: event.userName, password: event.password);
        preference.setString('token', topUpLoginModelClass.data!.access.toString());
        emit(TopUpLoginLoaded());
      }catch(e){
        emit(TopUpLoginError());
        print("-----------------LoginBlocCatchError $e");

      }


    });
  }
}

