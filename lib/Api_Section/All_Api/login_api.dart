import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/LoginModelClass.dart';
import 'package:topuptest/Api_Section/Repository/api_client.dart';

class UserApi {
  ApiClient apiClient = ApiClient();
  LoginModelClass loginModelclass = LoginModelClass();
  String loginpath = 'users/login';

  Future<LoginModelClass> getLoginFunction(
      {required String userName,
      required String password,
      required String service}) async {
    final body = {
      "username": userName,
      "password": password,
      "service": service
    };
    print(body);
    Response response =
        await apiClient.invokeAPI(path: loginpath, method: "LOGIN", body: body);
    print("========================================**************************" +
        response.toString());
    return LoginModelClass.fromJson(jsonDecode(response.body));
  }
}
