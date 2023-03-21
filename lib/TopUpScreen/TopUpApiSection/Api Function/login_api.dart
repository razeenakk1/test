import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/LoginModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Repository/api_client.dart';

import '../ModelClasses/TopUpLoginModelClass.dart';

class ApiLoginTopUp {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  TopUpLoginModelClass  topUpLoginModelClass = TopUpLoginModelClass();
  final String loginPath = "users/login";

  Future<TopUpLoginModelClass> loginFunction(
      {required String username, required String password}) async {
    final body = {
      "username": username,
      "password": password,
    };

    print("getlogin....");
    Response response = await topUpApiClient.invokeAPI(
        path: loginPath, method: "LOGIN", body: body);
    log("_________________loginBody $body");

    print("response worked");
    return TopUpLoginModelClass.fromJson(json.decode(response.body));
  }
}
