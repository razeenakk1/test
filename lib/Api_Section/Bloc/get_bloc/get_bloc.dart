import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/get_api.dart';
import 'package:topuptest/Api_Section/ModelClasses/GetModelClass.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  late GetModelClass getModelClass;
  GetApi getApi;
  GetBloc(this.getApi) : super(GetInitial()) {
    on<GetEvent>((event, emit) async{
      emit(GetLoading());
      try{
        getModelClass = await getApi.getCountryFunction();
        emit(GetLoaded());
      }catch(e){
        emit(GetError());
        print("___________$e");
      }
      // TODO: implement event handler
    });
  }
}
