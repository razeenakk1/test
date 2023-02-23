import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandName.dart';

part 'brand_name_event.dart';
part 'brand_name_state.dart';

class BrandNameBloc extends Bloc<BrandNameEvent, BrandNameState> {
  late BrandName brandName ;
  BrandApi brandApi;
  BrandNameBloc(this.brandApi) : super(BrandNameInitial()) {
    on<BrandNameEvent>((event, emit)async {
      emit(BrandNameLoading());
      try{
        brandName = await  brandApi.brandNameFunction();
        emit(BrandNameLoaded());
      }catch(e){
        emit(BrandNameError());
        print("-----------------$e");


      }

      // TODO: implement event handler
    });
  }
}
