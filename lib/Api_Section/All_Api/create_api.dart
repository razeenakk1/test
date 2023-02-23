import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/Banner_Model.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandCreateModelClass.dart';
import 'package:topuptest/Api_Section/Repository/api_client.dart';

class BannerApi {

  ApiClient apiClient = ApiClient();
  BrandCreateModelClass brandCreateModelClass = BrandCreateModelClass();

  Future<BrandCreateModelClass> createBanner({


    required String brandName,
    required String notes,
    required int createUserId,
    required int BranchID,
    required String CompanyID,

  }) async {
    String path = 'brands/create-brand/';
    final body = { "CompanyID":CompanyID ,
      "BranchID": BranchID,
      "CreatedUserID": createUserId,
      "BrandName": brandName,
      "Notes": notes};
    Response response =
    await apiClient.invokeAPI(path: path, method: "POST", body: body);
    return   BrandCreateModelClass.fromJson(jsonDecode(response.body));
  }
}