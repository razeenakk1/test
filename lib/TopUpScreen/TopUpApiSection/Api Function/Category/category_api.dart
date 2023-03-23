import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CategoryListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CreateCategoryModlClass.dart';

import '../../Repository/api_client.dart';

class CategoryApi {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CategoryListModelClass categoryListModelClass = CategoryListModelClass();
  CreateCategoryModlClass createCategoryModelClass = CreateCategoryModlClass();

  Future<CategoryListModelClass> listAndSearchApiFunction(
      {required String search}) async {
    String path = 'products/list-category/';
    final body = {"search": search};
    log("_________________searchTax $body");
    Response response =
        await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CategoryListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<CreateCategoryModlClass> createCategoryFunction({
    required String categoryName,}) async {
    String path = 'products/create-category/';
    final body = {
      "CategoryName":categoryName,
    };
    log("_________________createCategoryBody $body");
    Response response =
        await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateCategoryModlClass.fromJson(jsonDecode(response.body));
  }
}
