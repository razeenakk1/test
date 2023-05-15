import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ListAndSearch/Api_Section/Repository/api_exception.dart';

class ApiClientPagination {
  static const String basePath = 'https://www.api.viknbooks.com/api/v10/';

  Future<Response> invokeAPI(
      {required String path,
        required String method,
        required Object? body}) async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEyMDM5NDc5LCJpYXQiOjE2ODA1MDM0NzksImp0aSI6IjJiNWRkYWYwMzkzNTQwZmZhMjMzNmE2MGVmMGJlMjM5IiwidXNlcl9pZCI6NjJ9.ajmQNxvi8iK9jFzhlfLdR90WstX_c-mOlQnnu5bWViBekSHaDbbuiRUn842N6E63awHvU0mRmHh8AVd6M83K8NMAktQc7PnJD5r-qt9bEKBAiV_VBvMNZ1hq5uA8vfwHMobjaU7neuAhl-9DSCFP1tLCIAId-b2SFulLo98jG3a-cBRMvE-L1MgakxMg4etO1XOXLPrIugUNagyg7YqWFYhyWfj-pbNBBZiKVupPp-xQkNVeze0AW8UU_6t9WWrUYV-4uKpwfrs381SdBPx0DJ-qNINz5EUWYQBsfHHDfeNW93zbvcGgkcKs-8ebBia4wfXX61q913gjHxzvngR5rC2nlEJ7rxKhnlrxq8CQljZTqVIYzN5HMlFZoer-sVvjCT2S5orw3PDDhGbxIQEHWORlLKDYr152TZrIyqDqy89arnvHFJtsD9NmA4CjSqtPTy2OPwECaD6j1-AMmArn0vnhSJKPBCycmZV-QkVbwOFzPx74GihuVm0dfAQfAJm_x-Wg8daWZ1SZTU_6YPJB_ACfPsloHEaKWQsE78xUr9Uhtv8XO3kb-Dt5JW8JhB8FK5ieTaenOg4mPSHZyK0t5VA3L-ScQgTCbCqDfVAs1_naBW9r3X1TkchMf0b6DH5QahsgckrQS0Nk5opmlQ3y9CULvxDu3n-eTzyZe6Prsp8";

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // final tokens = prefs.getString('token');
    //  print(prefs.getString('token'));
    //   print(prefs.getString('token'));
    print("Invoke Api worked");
    print(method);



    print("Invoke Api worked");
    print(method);

    Map<String, String> headerParams = {};
    if (method == 'POST' || method == 'GET' || method == 'PATCH'|| method =="DELETE" ) {
      print("Methode POST OR GET");
      headerParams = {
        "authorization": "Bearer $token",
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    }else if(method == "DELETE_" ){
      print("method Delete_");
      headerParams = {
        "authorization": "Bearer $token",
      };

    }
    Response response;

    String url = basePath + path;
    // String searchurl =  basePath + 'search/movie'+'?api_key=$token'+ path;
    print('========================================' + url);


    // print(searchurl);
    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: headerParams, body: jsonEncode(body));
        break;
      case "LOGIN":
        response =
        await post(Uri.parse(url), headers: headerParams, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url), headers: headerParams, body: jsonEncode(body));
        break;
      case "PATCH":
        response = await patch(Uri.parse(url),
            headers: headerParams, body: jsonEncode(body));
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: headerParams,body: jsonEncode(body));
        break;
      case "DELETE_":
        response = await delete(Uri.parse(url), headers: headerParams,body: jsonEncode(body));
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: headerParams,
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;

      default:
        response = await get(Uri.parse(url), headers: headerParams);
    }
    log("**************${response.body}");

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      // print("if)()");
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    ;
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}