import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../ModelClasses/User/CreateUserModelClass.dart';
import '../../Repository/api_client.dart';

class UserApi{
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CreateUserModelClass createUserModelClass = CreateUserModelClass();
  Future<CreateUserModelClass> createUserFunction({
    required String firstName,
    required String username,
    required String email,
    required String password1,
    required String password2,
    required String phone,
    required String userRoles,
    required String isAdmin,

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

}