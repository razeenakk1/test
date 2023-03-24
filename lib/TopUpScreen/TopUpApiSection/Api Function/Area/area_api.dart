import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/AreaListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/CreateAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/DeleteAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/EditAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/SingleViewAreaModelClass.dart';

import '../../Repository/api_client.dart';

class AreaApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateAreaModelClass createAreaModelClass = CreateAreaModelClass();
  AreaListModelClass areaListModelClass = AreaListModelClass();
  DeleteAreaModelClass deleteAreaModelClass = DeleteAreaModelClass();
  EditAreaModelClass editAreaModelClass = EditAreaModelClass();
  SingleViewAreaModelClass singleViewAreaModelClass = SingleViewAreaModelClass();


  Future<CreateAreaModelClass> createAreaFunction({
    required String areaName}) async {
    String path = 'accounts/create-area/';
    final body = {
      "AreaName": areaName
    };
    log("_________________areaGroupBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateAreaModelClass.fromJson(jsonDecode(response.body));
  }


  Future<AreaListModelClass> listAndSearchAreaApiFunction(
      {required String search}) async {
    String path = 'accounts/list-area/';
    final body = {"search": search};
    log("_________________searchArea $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return AreaListModelClass.fromJson(jsonDecode(response.body));
  }
  Future<SingleViewAreaModelClass> singleViewAreaFunction({required String id})async{
    String path = "accounts/detail-area/";
    final body = {
      "id": id};
    log("_________________singleViewAreaBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewAreaModelClass.fromJson(jsonDecode(response.body));

  }
  Future<EditAreaModelClass> editAreaFunction({
    required String id,required String areaName}) async {
    String path = 'accounts/edit-area/';
    final body = {
      "id": id,
      "AreaName": areaName
    };
    log("_________________editArea $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditAreaModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteAreaModelClass> deleteAreaFunction({required String id}) async {
    String path = 'accounts/delete-area/';
    final body = {
      "id": id
    };
    log("_________________deleteArea $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteAreaModelClass.fromJson(jsonDecode(response.body));
  }



}