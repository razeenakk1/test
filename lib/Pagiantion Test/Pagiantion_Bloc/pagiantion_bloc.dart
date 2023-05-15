import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Pagiantion%20Test/PagiantionModelClass.dart';
import 'package:topuptest/Pagiantion%20Test/pagiantion_api.dart';

part 'pagiantion_event.dart';
part 'pagiantion_state.dart';

class PagiantionBloc extends Bloc<PagiantionEvent, PagiantionState> {
//  List<PagiantionModelClass> orderDetailsTable = [];
 late  Response response ;

  PaginationApi paginationApi;
  PagiantionBloc(this.paginationApi) : super(PagiantionInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        response= await paginationApi.getData(pagNo: 1,itemPerPage: 5);

        emit(DataLoaded());
      } catch (e) {
        log("+++++++++++++++++++++++++++++++++++++bloc catch error ${e.toString()}");
        emit(DataLoadError());
      }
    });

    on<LoadPageEvent>((event, emit) async {
      try {
        response = await paginationApi.getData(itemPerPage: event.itemPerPage, pagNo: event.pageNo);
        emit(DataLoaded());
      } catch (e) {
        log("++++++++++++++++++vi+++++++++++++++++++bloc catch error ${e.toString()}");
        emit(DataLoadError());
      }
    });
  }
}
