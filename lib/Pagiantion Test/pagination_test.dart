import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:topuptest/Pagiantion%20Test/Pagiantion_Bloc/pagiantion_bloc.dart';



class TestPagination extends StatefulWidget {
  const TestPagination({super.key});
  @override
  State<TestPagination> createState() => _TestPaginationState();
}

class _TestPaginationState extends State<TestPagination> {

  late  Response response ;

  @override
  void initState() {
    super.initState();
    //dataGet();
  }

   List<SalesInvoiceModel> orderDetailsTable = [];

  int pageNo = 2;
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  dataGet() {
    BlocProvider.of<PagiantionBloc>(context).add(GetDataEvent());
  }

  ValueNotifier valueNotifier = ValueNotifier(2);
  int itemCount = 0;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<PagiantionBloc, PagiantionState>(
            builder: (context, state) {
              if (state is DataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DataLoadError) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (state is DataLoaded) {
                response  = BlocProvider.of<PagiantionBloc>(context).response;
                print("__________________ ui response _____________________ ${response.body}");


            Map n = json.decode(utf8.decode(response.bodyBytes));
            var status = n["StatusCode"];
            var responseJson = n["data"];
            var itemCount =n["total_count"];
            /// map like a for loop,
                /// user is mdlcls - data - items
                print("________________________ responsedata ____________$responseJson");

            for (Map user in responseJson) {
              orderDetailsTable.add(SalesInvoiceModel.fromJson(user));
              print("________________________ responsedata  ___________$user");

            }

            _refreshController.loadComplete();
            return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ValueListenableBuilder(
                      valueListenable: valueNotifier,
                        builder: (context, value, child) {
                        return Expanded(
                          child: SmartRefresher(

                            enablePullDown: true,
                            enablePullUp: true,
                            onLoading: ()async {
                              final value = valueNotifier.value ++;
                              if(mounted) {
                                await Future.delayed(const Duration(milliseconds: 3));
                              }
                              orderDetailsTable.length != itemCount ?
                                 BlocProvider.of<PagiantionBloc>(context).add(LoadPageEvent(pageNo:value , itemPerPage:5)):
                                     null;
                              _refreshController.loadComplete();},
                            controller: _refreshController,
                            child: ListView.builder(
                              itemCount: orderDetailsTable.length ,

                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Container(
                                    color: Colors.grey,
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Text(orderDetailsTable[index].voucherNo),
                                        Text(orderDetailsTable[index].ledgerName),
                                        Text(orderDetailsTable[index].grandTotal),

                                      ],
                                    ),
                                  ),
                                );

                              }
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}


class SalesListMasterModel {
  int   ledgerID,salesOrderDetailsMasterID;
  String id,
      voucherNo,
      date,
      deliveryDate,
      deliveryTime,

      customerName,
      phone,
      area,
      grandTotal,
      status;


  SalesListMasterModel({

    required this.id,
    required this.salesOrderDetailsMasterID,
    required this.voucherNo,
    required this.date,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.ledgerID,
    required this.customerName,
    required this.area,
    required this.grandTotal,
    required this.phone,
    required this.status,

  });

  factory SalesListMasterModel.fromJson(Map<dynamic, dynamic> json) {
    return SalesListMasterModel(

      id: json['id']??'',
      salesOrderDetailsMasterID: json['SalesOrderMasterID'],
      voucherNo: json['VoucherNo'],
      date: json['Date'],
      deliveryDate: json['DeliveryDate'],
      deliveryTime: json['DeliveryTime'],
      ledgerID: json['LedgerID'],
      customerName: json['CustomerName'],
      area: json['Area'],
      grandTotal: json['GrandTotal'],
      status: json['Status'],
      phone: json['Phone'].toString(),
    );
  }


}
class SalesInvoiceModel {
  String invoiceUID, voucherNo, date, customerName, ledgerName;
  String grandTotal;




  SalesInvoiceModel(
      {required this.invoiceUID,
        required this.voucherNo,
        required this.date,
        required this.customerName,
        required this.ledgerName,
        required this.grandTotal});

  factory SalesInvoiceModel.fromJson(Map<dynamic, dynamic> json) {
    return SalesInvoiceModel(
        invoiceUID: json['id'],
        voucherNo: json['VoucherNo'],
        date: json['Date'],
        customerName: json['CustomerName'],
        ledgerName: json['LedgerName'],
        grandTotal: json['GrandTotal'].toString());
  }
}