import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Ledger/LedgerListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../../ModelClasses/Ledger/LedgerGroupListModelClass.dart';

class LedgerApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  LedgerListModelClass ledgerListModelClass = LedgerListModelClass();
  LedgerGroupListModelClass ledgerGroupListModelClass= LedgerGroupListModelClass();
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

}