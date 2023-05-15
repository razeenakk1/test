import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Pagiantion%20Test/pagination_test.dart';
import 'package:topuptest/payment_pagination/Bloc/payment_bloc.dart';
import 'package:topuptest/payment_pagination/payment_pagination.dart';

import 'pagiantion_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: GestureDetector(
                  onTap: (){
                    BlocProvider.of<PagiantionBloc>(context).add(GetDataEvent());

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestPagination()),
                    );
                  },
                    child: Text("Pagination")),
              ),
              Card(
                child: GestureDetector(

                    onTap: (){
                     BlocProvider.of<PaymentBloc>(context).add(FetchDataEvent());

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPagination()),
                      );
                    },
                    child: Text("Payment Pagination")),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
