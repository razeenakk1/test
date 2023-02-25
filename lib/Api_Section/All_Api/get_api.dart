import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/GetModelClass.dart';
import 'package:topuptest/Api_Section/Repository/api_client.dart';

class GetApi{
  ApiClient apiClient = ApiClient();
  GetModelClass getModelClass = GetModelClass();
  Future<GetModelClass> getCountryFunction()async {
    String path = "countries/countries/";
    Response response =
    await apiClient.invokeAPI(path: path, method: "GET", body: null);

    return GetModelClass.fromJson(jsonDecode(response.body));
  }
}