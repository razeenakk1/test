// import 'Data.dart';
//
// class BannerModel {
//   BannerModel({
//       this.statusCode,
//       this.data,});
//
//   BannerModel.fromJson(dynamic json) {
//     statusCode = json['StatusCode'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   int statusCode;
//   Data data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['StatusCode'] = statusCode;
//     if (data != null) {
//       map['data'] = data.toJson();
//     }
//     return map;
//   }
//
// }