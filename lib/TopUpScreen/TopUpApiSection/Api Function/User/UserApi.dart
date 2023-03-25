import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/UserListModelClass.dart';

import '../../ModelClasses/User/CreateUserModelClass.dart';
import '../../Repository/api_client.dart';

class ApiUser{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateUserModelClass createUserModelClass = CreateUserModelClass();
  UserListModelClass userListModelClass = UserListModelClass();
  Future<CreateUserModelClass> createUserFunction({
    required String firstName,
    required String username,
    required String email,
    required String password1,
    required String password2,
    required String phone,
    required String userRoles,
    required bool isAdmin,

  }) async {
    String path = 'users/user-signup/';
    final body = {
      "first_name": firstName,
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2,
      "phone": phone,
      "UserRoles": userRoles,
      "IsAdmin":isAdmin
    };
    log("_________________createUser $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateUserModelClass.fromJson(jsonDecode(response.body));
  }
  Future<UserListModelClass> listUserFunction({ required String search }) async {
    String path = 'users/user-list/';
    final body = {
      "search":search
    };
    log("_________________searchList $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return UserListModelClass.fromJson(jsonDecode(response.body));
  }

}