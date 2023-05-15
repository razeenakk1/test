import 'package:http/http.dart';
import 'package:topuptest/Pagiantion%20Test/api_client.dart';

class PaymentPaginationApi{
  ApiClientPagination apiClientPagination = ApiClientPagination();
  Future<Response> paymentGetDataFunction({required int itemPerPage , required int pagNo})async {
    final body = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 2,
      "product_name": "",
      "VoucherType": "ALL",
      "length": 0,
      "page_no":pagNo,
      "items_per_page":itemPerPage
    };
    String path = "payments/list/all/payment-details/";
    print("____________api body $body");
    Response response =
    await apiClientPagination.invokeAPI(path: path, method: "POST", body: body);
    return response;
  }

}