import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../TopUpScreen/Widgets/search_widget.dart';
import 'Api_Section/Bloc/product_list_bloc.dart';
import 'Api_Section/ModelClass/ListModelClass.dart';
import 'Api_Section/ModelClass/SearchModelClass.dart';

class ListAndSearchScreen extends StatefulWidget {
  const ListAndSearchScreen({Key? key}) : super(key: key);

  @override
  State<ListAndSearchScreen> createState() => _ListAndSearchScreenState();
}

class _ListAndSearchScreenState extends State<ListAndSearchScreen> {
  late ListModelClass listModelClass;

  late SearchModelClass searchModelClass;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ProductListBloc>(context).add(FetchProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: mHeight * .01),
          SearchFieldWidget(
              mHeight: mHeight,
              hintText: "Search",
              onChanged: (quary) {
                if (quary.isNotEmpty) {
                  BlocProvider.of<ProductListBloc>(context).add(
                    FetchSearchEvent(productName: quary, length: quary.length),
                  );
                } else {
                  BlocProvider.of<ProductListBloc>(context)
                      .add(FetchProductList());
                }
              },
              controller: searchController),
          SizedBox(height: mHeight * .01),
          Expanded(
            child: BlocBuilder<ProductListBloc, ProductListState>(
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
                                  leading: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Name    :   ${listModelClass.data![index].productName}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Purchase Price   :  ${listModelClass.data![index].purchasePrice}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
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
                }
                if (state is SearchLoaded) {
                  searchModelClass = BlocProvider.of<ProductListBloc>(context)
                      .searchModelClass;
                  return ListView(
                    children: [
                      // SizedBox(height: mHeight * .01),
                      //
                      // SearchFieldWidget(mHeight: mHeight,
                      //     hintText: "Search",
                      //     onChanged: (quary){
                      //       BlocProvider.of<ProductListBloc>(context).add(FetchSearchEvent(productName: quary, length: quary.length),
                      //       );
                      //
                      //     },
                      //     controller: searchController),
                      // SizedBox(height: mHeight * .01),

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
                                    leading: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Product Name    :   ${listModelClass.data![index].productName}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Purchase Price   :  ${listModelClass.data![index].purchasePrice}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ],
                  );
                }
                return const Center(
                  child: Text("loading...."),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
