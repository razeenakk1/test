import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/CompanyListModelClass.dart';
import 'package:topuptest/Api_Section/Repository/api_client.dart';

class CompanyListApi {
  ApiClient apiClient = ApiClient();
  CompanyListModelClass companyListModelClass = CompanyListModelClass();
  String path = 'users/companies/';
  int userId = 332 ;


  Future<CompanyListModelClass> companyListFunction (
      {required String userId, required bool isMobile}) async {
    final body = {"userId": userId, "is_mobile": isMobile};
    print(body);
    Response response =
        await apiClient.invokeAPI(path: path, method: "POST", body: body);
    print("=====================================" +
        response.toString());
    return CompanyListModelClass.fromJson(jsonDecode(response.body));
  }
}
