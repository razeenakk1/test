import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:topuptest/payment_pagination/payment_pagination_modelclass.dart';

import 'Bloc/payment_bloc.dart';

class PaymentPagination extends StatefulWidget {
  const PaymentPagination({Key? key}) : super(key: key);

  @override
  State<PaymentPagination> createState() => _PaymentPaginationState();
}

class _PaymentPaginationState extends State<PaymentPagination> {
  late  Response response ;

  @override
  void initState() {
    super.initState();
   // dataGet();
  }

  List<PaymentDetailModelClass> paymentDetailsTable = [];

  int pageNo = 2;

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  dataGet() {

    BlocProvider.of<PaymentBloc>(context).add(FetchDataEvent());
  }

  ValueNotifier valueNotifier = ValueNotifier(2);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              if (state is PaymentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PaymentError) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (state is PaymentLoaded) {
                response  = BlocProvider.of<PaymentBloc>(context).response;
                print("__________________ ui response _____________________ ${response.body}");


                Map n = json.decode(utf8.decode(response.bodyBytes));
                var status = n["StatusCode"];
                var responseJson = n["data"];
                var itemCount =n["count"];
                /// map like a for loop,
                /// user is mdlcls - data - items
                print("________________________ responsedata ____________$responseJson");

                for (Map user in responseJson) {
                  paymentDetailsTable.add(PaymentDetailModelClass.fromJson(user));
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
                                paymentDetailsTable.length != itemCount ?
                                BlocProvider.of<PaymentBloc>(context).add(LoadPageEvent(pageNo:value , itemPerPage:2)):
                                null;

                                print("++++++++++++++++++ value notifier value ++++++++++++++++++++++++$value");
                                _refreshController.loadComplete();},
                              controller: _refreshController,
                              child: ListView.builder(
                                  itemCount: paymentDetailsTable.length ,

                                  itemBuilder: (BuildContext context, int index) {


                                    return Card(
                                      child: Container(
                                        color: Colors.teal,
                                        height: 80,
                                        child: Column(
                                          children: [
                                            Text(paymentDetailsTable[index].ledgerName),
                                            Text(paymentDetailsTable[index].Balance),
                                            Text(paymentDetailsTable[index].date),
                                          //  Text(paymentDetailsTable[index].PaymentStatusName ),
                                            Text(paymentDetailsTable[index].list),

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
