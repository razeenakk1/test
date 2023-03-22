import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/SingleViewBrandModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/SingleViewTaxModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../../ModelClasses/CreateTaxModelClass.dart';

class TaxApi {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateTaxModelClass createTaxModelClass = CreateTaxModelClass();
  TaxListModelClass taxListModelClass = TaxListModelClass();
  SingleViewTaxModelClass singleViewTaxModelClass = SingleViewTaxModelClass();


  Future<CreateTaxModelClass> createTaxFunction({
    required String taxName,
    required String purchaseTax,
    required String saleTax,
  }) async {
    String path = 'accounts/create-taxType/';
    final body = {
      "TaxTypeName": taxName,
      "PurchaseTax": purchaseTax,
      "SaleTax": saleTax
    };
    log("_________________createTaxBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateTaxModelClass.fromJson(jsonDecode(response.body));
  }
  Future<TaxListModelClass> listTaxFunction() async {
    String path = 'accounts/list-taxType/';
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: null);
    return TaxListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<SingleViewTaxModelClass> singleViewTaxFunction({required String id}) async {
    String path = 'accounts/detail-taxType/';
    final body = {
      "id": id
    };
    log("_________________singleViewTax $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewTaxModelClass.fromJson(jsonDecode(response.body));
  }


}