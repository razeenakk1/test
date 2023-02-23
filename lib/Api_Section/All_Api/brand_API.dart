import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandName.dart';
import 'package:topuptest/Api_Section/ModelClasses/CompanyListModelClass.dart';
import 'package:topuptest/Api_Section/Repository/api_client.dart';

class BrandApi {
  ApiClient apiClient = ApiClient();
  BrandName brandModelClass = BrandName();

  String path = 'brands/search-brand-list/';



  Future<BrandName> brandNameFunction () async {
    final body = {
      "CompanyID":"9a380d3f-bf38-44a3-a3d4-38c12e964496" ,
      "BranchID": 1,
      "CreatedUserID": 332,
      "PriceRounding":2,
      "product_name":"",
      "length":0

    };
    print(body);
    Response response =
    await apiClient.invokeAPI(path: path, method: "POST", body: body);
    print("=====================================" +
        response.toString());
    return BrandName.fromJson(jsonDecode(response.body));
  }
}
