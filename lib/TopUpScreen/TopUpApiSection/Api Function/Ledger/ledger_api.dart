import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/DeleteLedgerModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../../ModelClasses/Ledger/CreateLedgerModelClass.dart';
import '../../ModelClasses/Ledger/LedgerGroupListModelClass.dart';
import '../../ModelClasses/Ledger/SingleViewModelClass.dart';

class LedgerApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  LedgerListModelClass ledgerListModelClass = LedgerListModelClass();
  LedgerGroupListModelClass ledgerGroupListModelClass= LedgerGroupListModelClass();
  CreateLedgerModelClass createLedgerModelClass  = CreateLedgerModelClass();
  DeleteLedgerModelClass ledgerModelClass = DeleteLedgerModelClass();
   SingleViewModelClass singleViewModelClass = SingleViewModelClass();






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

}