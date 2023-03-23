import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/SingleViewBrandModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/DeleteTaxModlClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/SingleViewTaxModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/TaxEditModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/TaxListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../../ModelClasses/TaxModelClasses/CreateTaxModelClass.dart';

class TaxApi {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateTaxModelClass createTaxModelClass = CreateTaxModelClass();
  TaxListModelClass taxListModelClass = TaxListModelClass();
  SingleViewTaxModelClass singleViewTaxModelClass = SingleViewTaxModelClass();
  TaxEditModelClass taxEditModelClass = TaxEditModelClass();
  DeleteTaxModlClass deleteTaxModelClass = DeleteTaxModlClass();


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
  Future<TaxListModelClass> listTaxFunction({ required String search }) async {
    String path = 'accounts/list-taxType/';
    final body = {
      "search":search
    };
    log("_________________searchTax $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
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
  Future<TaxEditModelClass> editTaxFunction({required String id,required String taxName, required String purchaseTax,required String salesTax}) async {
    String path = 'accounts/edit-taxType/';
    final body = {
      "id":id,
      "TaxTypeName": taxName,
      "PurchaseTax": purchaseTax,
      "SaleTax": salesTax
    };
    log("_________________editTax $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return TaxEditModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteTaxModlClass> deleteTaxFunction({required String id}) async {
    String path = 'accounts/delete-taxType/';
    final body = {
      "id": id
    };
    log("_________________deleteTax $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteTaxModlClass.fromJson(jsonDecode(response.body));
  }


}