import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/ListAndSearch/Api_Section/Bloc/product_list_bloc.dart';
import 'package:topuptest/ListAndSearch/Api_Section/ModelClass/ListModelClass.dart';
import 'package:topuptest/ListAndSearch/Api_Section/ModelClass/SearchModelClass.dart';
import 'package:topuptest/TopUpScreen/Widgets/search_widget.dart';

class ListAndSearchScreen extends StatefulWidget {
   ListAndSearchScreen({Key? key}) : super(key: key);

  @override
  State<ListAndSearchScreen> createState() => _ListAndSearchScreenState();
}

class _ListAndSearchScreenState extends State<ListAndSearchScreen> {

  late ListModelClass listModelClass ;
  late SearchModelClass searchModelClass ;

  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<ProductListBloc>(context).add(FetchProductList());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
  builder: (context, state) {
    if (state is ProductListLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ProductListLoaded) {
      listModelClass =
          BlocProvider.of<ProductListBloc>(context).listModelClass;
      return ListView(
        children: [
          SizedBox(height: mHeight * .01),

          SearchFieldWidget(mHeight: mHeight,
              hintText: "Search",
              onChanged: (quary){
                BlocProvider.of<ProductListBloc>(context).add(FetchSearchEvent(productName: quary, length: quary.length),
                );

              },
              controller: searchController),
          SizedBox(height: mHeight * .01),

          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listModelClass.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  // color: Color(0xffF2F2F2),
                  elevation: 0,
                  child: Container(
                    color: Colors.black,
                    height: mHeight * .1,
                    child: ListTile(
                      leading: Text(
                        listModelClass.data![index].productName.toString(), style: TextStyle(color: Colors.white),),
                    ),


                  ),
                );
              }),


        ],

      );
    }

    if (state is ProductListError) {
      return const Center(
        child: Text("something went wrong"),
      );
    } if(state is SearchLoaded){
      searchModelClass =
          BlocProvider.of<ProductListBloc>(context).searchModelClass;
      return ListView(
        children: [
          SizedBox(height: mHeight * .01),

          SearchFieldWidget(mHeight: mHeight,
              hintText: "Search",
              onChanged: (quary){
                BlocProvider.of<ProductListBloc>(context).add(FetchSearchEvent(productName: quary, length: quary.length),
                );

              },
              controller: searchController),
          SizedBox(height: mHeight * .01),

          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchModelClass.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  // color: Color(0xffF2F2F2),
                  elevation: 0,
                  child: Container(
                    color: Colors.black,
                    height: mHeight * .1,
                    child: ListTile(
                      leading: Text(
                     searchModelClass.data![index].productName != null?   searchModelClass.data![index].productName.toString():"product not found", style: TextStyle(color: Colors.white),),
                    ),


                  ),
                );
              }),


        ],

      );
    }
    return const Center(
      child: Text("loading...."),
    );
  },
),

    );
  }
}
