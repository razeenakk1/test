import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/login_api.dart';

import '../../ModelClasses/User/CreateUserModelClass.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late CreateUserModelClass createUserModelClass;
  UserApi userApi;
  UserBloc(this.userApi) : super(UserInitial()) {
    on<UserEvent>((event, emit) async{













    });
  }
}
