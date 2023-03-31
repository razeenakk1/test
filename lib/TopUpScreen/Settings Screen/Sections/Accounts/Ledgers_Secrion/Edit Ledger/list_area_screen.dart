import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../Constens/constens.dart';
import '../../../../../TopUpApiSection/Bloc/Area/area_bloc.dart';
import '../../../../../TopUpApiSection/ModelClasses/Area/AreaListModelClass.dart';
import '../../../../../Widgets/appbar_widget.dart';
import '../../../../../Widgets/search_widget.dart';

class ListAreaScreeen extends StatefulWidget {
   ListAreaScreeen({Key? key}) : super(key: key);

  @override
  State<ListAreaScreeen> createState() => _ListAreaScreeenState();
}

class _ListAreaScreeenState extends State<ListAreaScreeen> {
  final TextEditingController searchController = TextEditingController();
  late  AreaListModelClass areaListModelClass;

  @override
  void initState() {
    BlocProvider.of<AreaBloc>(context).add(ListAreaEvent(search: ''));


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(appBarTitle: "Area List"),
      backgroundColor: backGroundColor,
      body: Container(
        decoration: containerDecoration,
        padding: EdgeInsets.only(left: mWidth * .04, right: mWidth * .04),
        height: mHeight,
        // color: Colors.white,

        child: Column(
          children: [
            SizedBox(height: mHeight * .02),
            SearchFieldWidget(
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
              onChanged: (quary) {
                if (quary.isNotEmpty) {
                  BlocProvider.of<AreaBloc>(context)
                      .add(ListAreaEvent(search: quary));
                } else {
                  BlocProvider.of<AreaBloc>(context).add(ListAreaEvent(search: ''));
                }
              },
            ),
            SizedBox(height: mHeight * .01),
            Expanded(
              child: BlocBuilder<AreaBloc, AreaState>(
                builder: (context, state) {
                  if (state is AreaListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffB73312),
                      ),
                    );
                  }
                  if (state is AreaListLoaded) {
                    areaListModelClass =
                        BlocProvider.of<AreaBloc>(context)
                            .areaListModelClass;
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        areaListModelClass.data!.isNotEmpty
                            ? ListView.builder(
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            itemCount:
                            areaListModelClass.data!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  Navigator.pop(context,
                                    [areaListModelClass.data![index].areaName,areaListModelClass.data![index].areaID.toString(),
                                      areaListModelClass.data![index].id.toString()],);

                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    height: mHeight * .07,
                                    decoration:
                                    listPageContainerDecorationVariable,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                            areaListModelClass
                                                .data![index]
                                                .areaName !=
                                                null
                                                ? areaListModelClass
                                                .data![index]
                                                .areaName
                                                .toString()
                                                : "not found list name!",
                                            style:
                                            GoogleFonts.poppins(
                                              textStyle:
                                              const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                            : SizedBox(
                            height: mHeight * .7,
                            child: const Center(
                                child: Text(
                                  "Items not found !",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                )))
                      ],
                    );
                  }
                  if (state is AreaListError) {
                    const Text("Something went wrong");
                  }

                  return const Center(
                    child: SizedBox(),
                  );
                },
              ),
            ),
          ],
        ),
      ),





    );
  }
}
