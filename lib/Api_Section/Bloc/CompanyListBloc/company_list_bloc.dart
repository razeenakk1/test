import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/company_api.dart';
import 'package:topuptest/Api_Section/ModelClasses/CompanyListModelClass.dart';

part 'company_list_event.dart';
part 'company_list_state.dart';

class CompanyListBloc extends Bloc<CompanyListEvent, CompanyListState> {
  late CompanyListModelClass companyListModelClass;
  CompanyListApi companyListApi;
  CompanyListBloc(this.companyListApi) : super(CompanyListInitial()) {
    on<FetchCompanyEvent>((event, emit) async{
      emit(CompanyListLoading());
      try{
        companyListModelClass = await companyListApi.companyListFunction(userId: event.userId, isMobile: event.isMobile);
        emit(CompanyListLoaded());
      }catch(e){
       emit(CompanyListError());
        print("-----------------CompanyListBloc$e");


      }
      // TODO: implement event handler
    });
  }
}
