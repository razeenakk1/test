import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../ModelClasses/Group/CreateGroupModelClass.dart';
import '../../ModelClasses/Group/DeleteGroupModelClass.dart';
import '../../ModelClasses/Group/EditGroupModelClass.dart';
import '../../ModelClasses/Group/GroupListModelClass.dart';
import '../../ModelClasses/Group/SingleViewGroupModelClass.dart';
import '../../Repository/api_client.dart';

class GroupApi {
  TopUpApiClient topUpApiClient = TopUpApiClient();
  GroupListModelClass groupListModelClass = GroupListModelClass();
  CreateGroupModelClass createGroupModelClass = CreateGroupModelClass();
  SingleViewGroupModelClass singleViewGroupModelClass = SingleViewGroupModelClass();
  EditGroupModelClass editGroupModelClass = EditGroupModelClass();
  DeleteGroupModelClass deleteGroupModelClass = DeleteGroupModelClass();


  Future<GroupListModelClass> listAndSearchGroupApiFunction(
      {required String search}) async {
    String path = 'products/list-group/';
    final body = {"search": search};
    log("_________________searchGroup $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return GroupListModelClass.fromJson(jsonDecode(response.body));
  }

  Future<CreateGroupModelClass> createGroupFunction({
    required String productGroupName}) async {
    String path = 'products/create-group/';
    final body = {
      "ProductGroupName": productGroupName
    };
    log("_________________createGroupBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return CreateGroupModelClass.fromJson(jsonDecode(response.body));
  }

  Future<SingleViewGroupModelClass> singleViewGroupFunction({required String id,}) async {
    String path = 'products/detail-group/';
    final body = {
      "id": id};
    log("_________________singleViewGroupBody $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return SingleViewGroupModelClass.fromJson(jsonDecode(response.body));
  }
  Future<EditGroupModelClass> editGroupFunction({
    required String id,required String productGroupName}) async {
    String path = 'products/edit-group/';
    final body = {
      "id": id,
      "ProductGroupName": productGroupName
    };
    log("_________________editGroup $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return EditGroupModelClass.fromJson(jsonDecode(response.body));
  }
  Future<DeleteGroupModelClass> deleteGroupFunction({required String id}) async {
    String path = 'products/delete-group/';
    final body = {
      "id": id
    };
    log("_________________deleteGroup $body");
    Response response =
    await topUpApiClient.invokeAPI(path: path, method: "POST", body: body);
    return DeleteGroupModelClass.fromJson(jsonDecode(response.body));
  }

}