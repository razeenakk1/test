import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/payment_pagination/payment_pagiantion_api.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  late  Response response ;
  PaymentPaginationApi paymentPaginationApi;
  PaymentBloc(this.paymentPaginationApi) : super(PaymentInitial()) {
    on<FetchDataEvent>((event, emit) async{

      emit(PaymentLoading());
      try {
        response= await paymentPaginationApi.paymentGetDataFunction(pagNo: 1,itemPerPage: 2);

        emit(PaymentLoaded());
      } catch (e) {
        log("+++++++++++++++++++++++++++++++++++++bloc catch error ${e.toString()}");
        emit(PaymentError());
      }
    });

    on<LoadPageEvent>((event, emit) async {
      try {
        response = await paymentPaginationApi.paymentGetDataFunction(itemPerPage: event.itemPerPage, pagNo: event.pageNo);
        emit(PaymentLoaded());
      } catch (e) {
        log("++++++++++++++++++second+++++++++++++++++++bloc catch error ${e.toString()}");
        emit(PaymentError());
      }
    });
  }
}
