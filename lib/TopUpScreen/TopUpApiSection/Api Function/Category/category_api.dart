import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CategoryListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CreateCategoryModlClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/DeleteCategorModelClass.dart';

import '../../ModelClasses/Category/EditCategoryModelClass.dart';
import '../../ModelClasses/Category/SingleViewCategoryModelClass.dart';
import '../../Repository/api_client.dart';

class CategoryApi {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  CategoryListModelClass categoryListModelClass = CategoryListModelClass();
  CreateCategoryModlClass createCategoryModelClass = CreateCategoryModlClass();
  SingleViewCategoryModelClass singleViewCategoryModelClass = SingleViewCategoryModelClass();
  EditCategoryModelClass editCategoryModelClass = EditCategoryModelClass();
  DeleteCategorModelClass deleteCategoryModelClass = DeleteCategorModelClass();

  Future<CategoryListModelClass> listAndSearchApiFunction(
      {required String search}) async {
    String path = 'products/list-category/';
    final body = {"search": search};
    log("_________________searchCategory $body");
    Response response =
        await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CategoryListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<CreateCategoryModlClass> createCategoryFunction({
    required String categoryName,}) async {
    String path = 'products/create-category/';
    final body = {
      "CategoryName":categoryName
    };
    log("_________________createCategoryBody $body");
    Response response =
        await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateCategoryModlClass.fromJson(jsonDecode(response.body));
  }

  Future<SingleViewCategoryModelClass> singleViewCategoryFunction({required String id,}) async {
    String path = 'products/detail-category/';
    final body = {
      "id": id};
    log("_________________singleViewCategoryBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewCategoryModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditCategoryModelClass> editCategoryFunction({
    required String id,required String categoryName}) async {
    String path = 'products/edit-category/';
    final body = {
      "id": id,
      "CategoryName": categoryName
    };
    log("_________________editCategory $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditCategoryModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteCategorModelClass> deleteCategoryFunction({required String id}) async {
    String path = 'products/delete-category/';
    final body = {
      "id": id
    };
    log("_________________deleteCategory $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteCategorModelClass.fromJson(jsonDecode(response.body));
  }

}
