import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/Ledger/ledger_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/CreateLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/DeleteLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';

import '../../ModelClasses/Ledger/LedgerGroupListModelClass.dart';
import '../../ModelClasses/Ledger/SingleViewModelClass.dart';

part 'ledger_event.dart';
part 'ledger_state.dart';

class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  late LedgerListModelClass ledgerListModelClass;
  late LedgerGroupListModelClass ledgerGroupListModelClass;
  late CreateLedgerModelClass createLedgerModelClass;
  late DeleteLedgerModelClass deleteLedgerModelClass;
  late SingleViewModelClass singleViewModelClass;
  LedgerApi ledgerApi;
  LedgerBloc(this.ledgerApi) : super(LedgerInitial()) {
    on<ListLedgerEvent>((event, emit) async {

        emit(LedgerListLoading());
        try {
          ledgerListModelClass = await ledgerApi.listLedgerFunction(search: event.search);
          emit(LedgerListLoaded());
        } catch (e) {

          emit(LedgerListError());
          print("-----------------******************legerListBlocCatchError $e");
        }

    });
    on<ListLedgerGroupEvent>((event, emit) async {

      emit(LedgerGroupListLoading());
      try {
        ledgerGroupListModelClass = await ledgerApi.listLedgerGroupFunction(search: event.search);
        emit(LedgerGroupListLoaded());
      } catch (e) {

        emit(LedgerGroupListError());
        print("-----------------******************ledgerGroupListBlocCatchError $e");
      }

    });
    on<CreateLedgerEvent>((event, emit) async {

      emit(LedgerCreateLoading());
      try {
        createLedgerModelClass = await ledgerApi.createLedgerFunction(
            ledgerName: event.ledgerName, accountGroupUnder:  event.accountGroupUnder,
            openingBalance:  event.openingBalance, asnDate:  event.asnDate, address:  event.address,
            phone:  event.phone, email:  event.email, isVat:  event.isVat, vatNo:  event.vatNo, areaId:  event.areaId);

        emit(LedgerCreateLoaded());
      } catch (e) {

        emit(LedgerCreateError());
        print("-----------------******************createBlocCatchError $e");
      }

    });
    on<DeleteLedgerEvent>((event, emit) async {

      emit(DeleteLedgerLoading());
      try {

        deleteLedgerModelClass   = await ledgerApi.deleteLedgerFunction(id: event.id);

        emit(DeleteLedgerLoaded());
      } catch (e) {

        emit(DeleteLedgerError());
        print("-----------------******************deleteBlocCatchError $e");
      }

    });
    on<SingleViewLedgerEvent>((event, emit) async {

      emit(SingleViewLedgerLoading());
      try {
        singleViewModelClass   = await ledgerApi.singleViewLedgerFunction(id: event.id);
        emit(SingleViewLedgerLoaded());
      } catch (e) {

        emit(SingleViewLedgerError());
        print("-----------------******************editBlocCatchError $e");
      }

    });


  }
}
