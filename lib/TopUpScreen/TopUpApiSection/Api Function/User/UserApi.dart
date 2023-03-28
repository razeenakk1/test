import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/EditUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/SingleViewUserModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/User/UserListModelClass.dart';

import '../../ModelClasses/User/CreateUserModelClass.dart';
import '../../ModelClasses/User/DeleteUserModelClass.dart';
import '../../Repository/api_client.dart';

class ApiUser{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateUserModelClass createUserModelClass = CreateUserModelClass();
  UserListModelClass userListModelClass = UserListModelClass();
  SingleViewUserModelClass  singleViewUserModelClass = SingleViewUserModelClass();
  EditUserModelClass editUserModelClass = EditUserModelClass();
  DeleteUserModelClass deleteUserModelClass = DeleteUserModelClass();
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
    Response response = await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return UserListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<SingleViewUserModelClass> singleViewUserFunction({required String id}) async {
    String path = 'users/user-detail/';
    final body = {
      "id": id
    };
    log("_________________singleViewUser $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewUserModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditUserModelClass> editUserFunction({
    required num id,
    required String firstName,
    required String username,
    required String email,
    required String password1,
    required String password2,
    required String phone,
    required String userRoles,
    required bool isAdmin,
  }) async {
    String path = 'users/user-edit/';
    final body = {
      "id":id,
      "first_name": firstName,
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2,
      "phone": phone,
      "UserRoles":userRoles,
      "IsAdmin":isAdmin
    };
    log("_________________editUser $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditUserModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteUserModelClass> deleteUserFunction({required String id}) async {
    String path = 'users/user-delete/';
    final body = {
      "id": id
    };
    log("_________________deleteUser $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteUserModelClass.fromJson(jsonDecode(response.body));
  }



}