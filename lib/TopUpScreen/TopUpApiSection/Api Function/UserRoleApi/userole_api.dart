import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/DeleteUseroleModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/EditUseroleModleClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/SingleViewUseroleModelClass.dart';

import '../../ModelClasses/Userole/UserRoleListModelClass.dart';
import '../../Repository/api_client.dart';

class UserRoleApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  UserRoleListModelClass userRoleListModelClass = UserRoleListModelClass();
  CreateUserRoleModelClass createUserRoleModelClass = CreateUserRoleModelClass();
  SingleViewUseroleModelClass singleViewUseroleModelClass = SingleViewUseroleModelClass();
  EditUseroleModleClass editUseroleModelClass = EditUseroleModleClass();
  DeleteUseroleModelClass deleteUseroleModelClass = DeleteUseroleModelClass();

  Future<UserRoleListModelClass> listUseroleFunction({
    required String search,

  }) async {
    String path = 'users/list-user_role/';
    final body = {
      "search":search
    };
    log("_________________createTaxBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return UserRoleListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<CreateUserRoleModelClass> createUserRoleFunction({
    required String userRoleName,
    required bool isSale,
    required bool isPurchase,
    required bool isReports,
    required bool isStockUpdate}) async {
    String path = 'users/create-user_role/';
    final body = {
      "UserRoleName": userRoleName,
      "is_sale": isSale,
      "is_purchase": isPurchase,
      "is_Reports": isReports,
      "is_StockUpdate": isStockUpdate
    };
    log("_________________createUserRoleBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateUserRoleModelClass.fromJson(jsonDecode(response.body));
  }
  Future<SingleViewUseroleModelClass> singleViewUseroleFunction({required String id}) async {
    String path = 'users/detail-user_role/';
    final body = {
      "id": id
    };
    log("_________________singleViewUserole $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewUseroleModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditUseroleModleClass> editUseroleFunction({
    required String id,required String useroleName, required bool isSale,
    required bool isPurchase,
    required bool isReports,
    required bool isStockUpdate}) async {
    String path = 'users/edit-user_role/';
    final body = {
      "UserRoleName": useroleName,
      "is_sale": isSale,
      "is_purchase": isPurchase,
      "is_Reports": isReports,
      "is_StockUpdate": isStockUpdate,
      "id": id
    };
    log("_________________editUserole $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditUseroleModleClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteUseroleModelClass> deleteUseroleFunction({required String id}) async {
    String path = 'users/delete-user_role/';
    final body = {
      "id": id
    };
    log("_________________deleteUserole $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteUseroleModelClass.fromJson(jsonDecode(response.body));
  }


}