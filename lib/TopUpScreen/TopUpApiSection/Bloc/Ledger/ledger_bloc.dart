import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/Ledger/ledger_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';

import '../../ModelClasses/Ledger/LedgerGroupListModelClass.dart';

part 'ledger_event.dart';
part 'ledger_state.dart';

class LedgerBloc extends Bloc<LedgerEvent, LedgerState> {
  late LedgerListModelClass ledgerListModelClass;
  late LedgerGroupListModelClass ledgerGroupListModelClass;
  LedgerApi ledgerApi;
  LedgerBloc(this.ledgerApi) : super(LedgerInitial()) {
    on<ListLedgerEvent>((event, emit) async {

        emit(LedgerListLoading());
        try {
          ledgerListModelClass = await ledgerApi.listLedgerFunction(search: event.search);
          emit(LedgerListLoaded());
        } catch (e) {

          emit(LedgerListError());
          print("-----------------******************UserListBlocCatchError $e");
        }

    });
    on<ListLedgerGroupEvent>((event, emit) async {

      emit(LedgerGroupListLoading());
      try {
        ledgerGroupListModelClass = await ledgerApi.listLedgerGroupFunction(search: event.search);
        emit(LedgerGroupListLoaded());
      } catch (e) {

        emit(LedgerGroupListError());
        print("-----------------******************UserListBlocCatchError $e");
      }

    });
  }
}
