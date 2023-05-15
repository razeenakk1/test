import 'dart:convert';

import 'package:http/http.dart';
import 'package:topuptest/Pagiantion%20Test/PagiantionModelClass.dart';
import 'package:topuptest/Pagiantion%20Test/api_client.dart';

class PaginationApi{
  ApiClientPagination apiClientPagination = ApiClientPagination();
  PagiantionModelClass pagiantionModelClass = PagiantionModelClass();



  Future<Response> getData({required int itemPerPage , required int pagNo})async {
    final body = {
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "BranchID": 1, "CreatedUserID": 62,
      "PriceRounding": 2, "QtyRounding": 2,
      "items_per_page": itemPerPage, "page_no": pagNo
    };
    String path = "sales/sale-list-page/";
    print("____________api body $body");
    Response response =
    await apiClientPagination.invokeAPI(path: path, method: "POST", body: body);
    return response;
  }

}