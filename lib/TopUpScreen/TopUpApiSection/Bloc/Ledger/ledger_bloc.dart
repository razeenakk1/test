import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/Ledger/ledger_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/CreateLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/DeleteLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';

import '../../ModelClasses/Ledger/AddressModelClass/CreateAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/DefaultAddresssModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/DeleteAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/EditAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/ListAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/SingleViewAddressModelClass.dart';
import '../../ModelClasses/Ledger/EditLedgerModelClass.dart';
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
  late EditLedgerModelClass editLedgerModelClass;

  late CreateAddressModelClass createAddressModelClass ;
  late DefaultAddresssModelClass defaultAddressModelClass ;
  late  DeleteAddressModelClass deleteAddressModelClass ;
  late SingleViewAddressModelClass singleViewAddressModelClass ;
  late ListAddressModelClass listAddressModelClass ;
  late  EditAddressModelClass editAddressModelClass ;




  LedgerApi ledgerApi;

  LedgerBloc(this.ledgerApi) : super(LedgerInitial()) {
    on<ListLedgerEvent>((event, emit) async {
      emit(LedgerListLoading());
      try {
        ledgerListModelClass =
            await ledgerApi.listLedgerFunction(search: event.search);
        emit(LedgerListLoaded());
      } catch (e) {
        emit(LedgerListError());
        print("-----------------******************legerListBlocCatchError $e");
      }
    });
    on<ListLedgerGroupEvent>((event, emit) async {
      emit(LedgerGroupListLoading());
      try {
        ledgerGroupListModelClass =
            await ledgerApi.listLedgerGroupFunction(search: event.search);
        emit(LedgerGroupListLoaded());
      } catch (e) {
        emit(LedgerGroupListError());
        print(
            "-----------------******************ledgerGroupListBlocCatchError $e");
      }
    });
    on<CreateLedgerEvent>((event, emit) async {
      emit(LedgerCreateLoading());
      try {
        createLedgerModelClass = await ledgerApi.createLedgerFunction(
            ledgerName: event.ledgerName,
            accountGroupUnder: event.accountGroupUnder,
            openingBalance: event.openingBalance,
            asnDate: event.asnDate,
            address: event.address,
            phone: event.phone,
            email: event.email,
            isVat: event.isVat,
            vatNo: event.vatNo,
            areaId: event.areaId);

        emit(LedgerCreateLoaded());
      } catch (e) {
        emit(LedgerCreateError());
        print("-----------------******************createBlocCatchError $e");
      }
    });
    on<DeleteLedgerEvent>((event, emit) async {
      emit(DeleteLedgerLoading());
      try {
        deleteLedgerModelClass =
            await ledgerApi.deleteLedgerFunction(id: event.id);

        emit(DeleteLedgerLoaded());
      } catch (e) {
        emit(DeleteLedgerError());
        print("-----------------******************deleteBlocCatchError $e");
      }
    });
    on<SingleViewLedgerEvent>((event, emit) async {
      emit(SingleViewLedgerLoading());
      try {
        singleViewModelClass =
            await ledgerApi.singleViewLedgerFunction(id: event.id);
        emit(SingleViewLedgerLoaded());
      } catch (e) {
        emit(SingleViewLedgerError());
        print("-----------------******************editBlocCatchError $e");
      }
    });
    on<EditLedgerEvent>((event, emit) async {
      emit(EditLedgerLoading());
      try {
        editLedgerModelClass = await ledgerApi.editLedgerFunction(
            id: event.ledgerId,
            ledgerName: event.ledgerName,
            balance: event.balance,
            asOnDate: event.asOnDate,
            address: event.address,
            phone: event.phone,
            email: event.email,
            isVat: event.isVat,
            vatNo: event.vatNo,
            areaID: event.areaID,
            partyID: event.partyID);
        emit(EditLedgerLoaded());
      } catch (e) {
        emit(EditLedgerError());
        print("-----------------******************editBlocCatchError $e");
      }
    });


    /// address bloc
    on<CreateAddressEvent>((event, emit) async {
      emit(AddressCreateLoading());
      try {
       createAddressModelClass = await ledgerApi.createAddressFunction(areaId:
       event.areaId, ledgerId:  event.ledgerId, home:  event.home, address:  event.address);
        emit(AddressCreateLoaded());
      } catch (e) {
        emit(AddressCreateError());
        print("-----------------******************createAddressBlocCatchError $e");
      }
    });
    on<DefaultAddressEvent>((event, emit) async {
      emit(DefaultAddressLoading());
      try {
      defaultAddressModelClass = await ledgerApi.defaultAddressFunction(addressId: event.addressId, isDefault: event.isDefault);
        emit(DefaultAddressLoaded());
      } catch (e) {
        emit(DefaultAddressError());
        print("-----------------******************defaultAddressBlocCatchError $e");
      }
    });
    on<DeleteAddressEvent>((event, emit) async {
      emit(DeleteAddressLoading());
      try {
        deleteAddressModelClass = await ledgerApi.deleteAddressFunction(addressId: event.addressId);
        emit(DeleteAddressLoaded());
      } catch (e) {
        emit(DeleteAddressError());
        print("-----------------******************deleteAddressBlocCatchError $e");
      }
    });
    on<ListAddressEvent>((event, emit) async {
      emit(AddressListLoading());
      try {
        listAddressModelClass = await ledgerApi.listAddressFunction(search: event.search, ledgerUuId: event.ledgerUuId);
        emit(AddressListLoaded());
      } catch (e) {
        emit(AddressListLoading());
        print("-----------------******************listAddressBlocCatchError $e");
      }
    });
    on<SingleViewAddressEvent>((event, emit) async {
      emit(AddressSingleViewLoading());
      try {
      singleViewAddressModelClass = await ledgerApi.singleViewAddressFunction(addressId: event.addressId);
        emit(AddressSingleViewLoaded());
      } catch (e) {
        emit(AddressSingleViewError());
        print("-----------------******************singleViewAddressBlocCatchError $e");
      }
    });
    on<EditAddressEvent>((event, emit) async {
      emit(AddressEditLoading());
      try {
       editAddressModelClass = await ledgerApi.editAddressFunction(addressId: event.addressId, areasId: event.areasId, addressName: event.addressName, address: event.address);
        emit(AddressEditLoaded());
      } catch (e) {
        emit(AddressEditError());
        print("-----------------******************editAddressBlocCatchError $e");
      }
    });

  }
}
