import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Userole/CreateUserRoleModelClass.dart';

import '../../ModelClasses/Userole/UserRoleListModelClass.dart';
import '../../Repository/api_client.dart';

class UserRoleApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  UserRoleListModelClass userRoleListModelClass = UserRoleListModelClass();
  CreateUserRoleModelClass createUserRoleModelClass = CreateUserRoleModelClass();

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
    required bool isStockUpdate

  }) async {
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


}