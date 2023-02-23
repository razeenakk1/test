import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/BrandNameModel/brand_name_bloc.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandName.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late BrandName brandName;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery
        .of(context)
        .size
        .width;
    final mHieght = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: mHieght * .1,
                child: AlertDialog(

                  content: Text("gfhfjh"),
                  actions: <Widget>[
                    new TextButton(
                      child: Text("create"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: mHieght * .1,
            ),
            BlocBuilder<BrandNameBloc, BrandNameState>(
              builder: (context, state) {
    if(state is BrandNameLoaded) {
      brandName = BlocProvider.of<BrandNameBloc>(context).brandName;

      return ListView.builder(
          itemCount: brandName.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.add),
                title:  Text(
                  brandName.data![index].brandName.toString(),

                ),
                trailing: const Icon(Icons.done),




              ),
            );
          }
      );
    }
    if(state is BrandNameLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
              },
            )


          ],
        ),
      ),


    );
  }
}
