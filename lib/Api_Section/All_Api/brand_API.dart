import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandCreateModelClass.dart';
import 'package:topuptest/Api_Section/ModelClasses/SingleViewBrandModelClass.dart';

import 'package:topuptest/Api_Section/Repository/api_client.dart';

class BrandApi {
  ApiClient apiClient = ApiClient();




  BrandCreateModelClass brandCreateModelClass = BrandCreateModelClass();

  Future<BrandCreateModelClass> createBanner({
    required String brandName,
    required String notes,
    required int createUserId,
    required int branchID,
    required String companyID,
  }) async {
    String path = 'brands/create-brand/';
    final body = {
      "CompanyID": companyID,
      "BranchID": branchID,
      "CreatedUserID": createUserId,
      "BrandName": brandName,
      "Notes": notes
    };
    Response response =
        await apiClient.invokeAPI(path: path, method: "POST", body: body);
    return BrandCreateModelClass.fromJson(jsonDecode(response.body));
  }

  Future<Response> deleteBanner(
      {required int createUserId,
      required String companyId,
      required int branchId}) async {
    final body = {
      "CreatedUserID": createUserId,
      "CompanyID": companyId,
      "BranchID": branchId
    };
    String path = 'brands/delete/brand/9a380d3f-bf38-44a3-a3d4-38c12e964496';
    Response response =
        await apiClient.invokeAPI(path: path, method: "POST", body: body);
    print(body);
    return response;
  }
  Future<Response> singleViewBrand(
      {required String companyID,
        required int branchId,
        required String brandName,
        required String notes,
        required int userID}) async {
    final body = {

        "CompanyID": companyID,
        "BranchID": branchId,
        "BrandName":brandName,
        "Notes": notes,
        "CreatedUserID": userID

    };
    print(body);
    String path = 'brands/view/brand/19b37135-bc8c-4fa5-a425-9751b1c656a6/';
    print("&&&&&&&&&&path");
    print("_________________________________________________________");
    Response response = await apiClient.invokeAPI(path: path, method: "POST", body: body);
    print("&&&&&&&&&&path");
    print(body);
    print("&&&&&&&&&&pathhhhhhj");
    return response;
  }
}





