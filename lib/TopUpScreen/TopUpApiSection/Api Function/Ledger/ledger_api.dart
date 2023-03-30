import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/DeleteLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../../ModelClasses/Ledger/AddressModelClass/CreateAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/DefaultAddresssModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/DeleteAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/EditAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/ListAddressModelClass.dart';
import '../../ModelClasses/Ledger/AddressModelClass/SingleViewAddressModelClass.dart';
import '../../ModelClasses/Ledger/CreateLedgerModelClass.dart';
import '../../ModelClasses/Ledger/EditLedgerModelClass.dart';
import '../../ModelClasses/Ledger/LedgerGroupListModelClass.dart';
import '../../ModelClasses/Ledger/SingleViewModelClass.dart';

class LedgerApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  LedgerListModelClass ledgerListModelClass = LedgerListModelClass();
  LedgerGroupListModelClass ledgerGroupListModelClass= LedgerGroupListModelClass();
  CreateLedgerModelClass createLedgerModelClass  = CreateLedgerModelClass();
  DeleteLedgerModelClass ledgerModelClass = DeleteLedgerModelClass();
   SingleViewModelClass singleViewModelClass = SingleViewModelClass();
  EditLedgerModelClass editLedgerModelClass = EditLedgerModelClass();
  CreateAddressModelClass createAddressModelClass = CreateAddressModelClass();
  DefaultAddresssModelClass defaultAddressModelClass = DefaultAddresssModelClass();
  DeleteAddressModelClass deleteAddressModelClass = DeleteAddressModelClass();
  SingleViewAddressModelClass singleViewAddressModelClass = SingleViewAddressModelClass();
  ListAddressModelClass listAddressModelClass = ListAddressModelClass();
  EditAddressModelClass editAddressModelClass = EditAddressModelClass();






  Future<LedgerListModelClass> listLedgerFunction({ required String search }) async {
    String path = 'accounts/list-ledger/';
    final body = {
      "search":search
    };
    log("_________________searchLedger $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return LedgerListModelClass.fromJson(jsonDecode(response.body));
  }
  Future<LedgerGroupListModelClass> listLedgerGroupFunction({ required String search }) async {
    String path = 'accounts/list-accountGroups/';
    final body = {
      "search":search
    };
    log("_________________searchLedgerGroup $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return LedgerGroupListModelClass.fromJson(jsonDecode(response.body));
  }
  Future<CreateLedgerModelClass> createLedgerFunction({
    required String ledgerName,
    required int accountGroupUnder,
    required int openingBalance,
    required String asnDate,
    required String address,
    required String phone,
    required String email,
    required bool isVat,
    required String vatNo,
    required String areaId,
  }) async {
    String path = 'accounts/create-ledger/';
    final body = {
      "LedgerName": ledgerName,
      "AccountGroupUnder": accountGroupUnder,
      "OpeningBalance": openingBalance,
      "AsOnDate": asnDate,
      "Address": address,
      "Phone": phone,
      "Email":email,
      "IsVat": isVat,
      "VatNo": vatNo,
      "AreaID": areaId
    };
    log("_________________create ledger $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateLedgerModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteLedgerModelClass> deleteLedgerFunction({required String id}) async {
    String path = 'accounts/delete-ledger/';
    final body = {
      "id": id
    };
    log("_________________deleteLedger $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteLedgerModelClass.fromJson(jsonDecode(response.body));
  }
  Future<SingleViewModelClass> singleViewLedgerFunction({required String id}) async {
    String path = 'accounts/detail-ledger/';
    final body = {
      "id": id
    };
    log("_________________singleView $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditLedgerModelClass> editLedgerFunction({
    required String id,
    required String ledgerName,
    required String balance,
    required String asOnDate,
    required String address,
    required String phone,
    required String email,
    required bool isVat,
    required String vatNo,
    required String areaID,
    required int partyID,


  }) async {
    String path = 'accounts/edit-ledger/';
    final body = {
      "LedgerID":id,
      "LedgerName": ledgerName,
      "Balance": balance,
      "AsOnDate": asOnDate,
      "Address": address,
      "Phone": phone,
      "Email": email,
      "IsVat": isVat,
      "VatNo":vatNo,
      "AreaID":areaID,
      "PartyID":partyID
    };
    log("_________________editLedger $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditLedgerModelClass.fromJson(jsonDecode(response.body));
  }
  /// Ledger Address Section ;


  Future<CreateAddressModelClass> createAddressFunction({
    required String areaId ,
    required String ledgerId ,
    required String home,
    required String address}) async {
    String path = 'accounts/create-address/';
    final body = {
      "AreaID": areaId,
      "LedgerId":   ledgerId,
      "AddressName":home,
      "Address": address
    };
    log("_________________create-address $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateAddressModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DefaultAddresssModelClass> defaultAddressFunction({required String addressId , required bool isDefault }) async {
    String path = 'accounts/default-address/';
    final body = {
      "id": addressId,
      "IsDefault" : isDefault
    };
    log("_________________default-address $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DefaultAddresssModelClass.fromJson(jsonDecode(response.body));
  }

  Future<DeleteAddressModelClass> deleteAddressFunction({required String addressId }) async {
    String path = 'accounts/delete-address/';
    final body = {
      "id": addressId,

    };
    log("_________________delete-address $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteAddressModelClass.fromJson(jsonDecode(response.body));
  }
  Future<SingleViewAddressModelClass> singleViewAddressFunction({required String addressId }) async {
    String path = 'accounts/detail-address/';
    final body = {
      "id": addressId,

    };
    log("_________________singleView-address $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewAddressModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditAddressModelClass> editAddressFunction({required String addressId,
    required String areasId, required String addressName, required String address }) async {
    String path = 'accounts/edit-address/';
    final body = {
      "id":  addressId,
      "Areas":areasId,
      "AddressName":addressName,
      "Address": address

    };
    log("_________________edit-address $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditAddressModelClass.fromJson(jsonDecode(response.body));
  }
  Future<ListAddressModelClass> listAddressFunction({ required String search }) async {
    String path = 'accounts/list-address/';
    final body = {
      "search":search
    };
    log("_________________searchAddressGroup $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return ListAddressModelClass.fromJson(jsonDecode(response.body));
  }

}