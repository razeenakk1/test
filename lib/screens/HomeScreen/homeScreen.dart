import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/BrandBloc/brand_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/get_bloc/get_bloc.dart';
import 'package:topuptest/Api_Section/ModelClasses/GetModelClass.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<GetBloc>(context).add(GetCountryEvent());
    // TODO: implement initState
    super.initState();
  }
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  late GetModelClass getModelClass;

  @override
  Widget build(BuildContext context) {
    final mHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: mHieght * .1,
                child: AlertDialog(
                  content: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                      ),
                      SizedBox(
                        height: mHieght * .02,
                      ),
                      TextFormField(
                        controller: noteController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Note',
                        ),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("create"),
                      onPressed: () {
                        BlocProvider.of<BrandBloc>(context).add(
                          CreateBrandEvent(
                              title: titleController.text,
                              note: noteController.text,
                              branchID: 1,
                              companyID: "9a380d3f-bf38-44a3-a3d4-38c12e964496",
                              createUserId: 332),
                        );
                        Navigator.pop(context);
                      },
                    ),

                  ],
                ),
              );
            },
          );
        },
        // isExtended: true,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: mHieght * .1,
            ),
            Container(
                height: mHieght * .1,
                color: Colors.grey,
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<BrandBloc>(context).add(DeleteMethodEvent(
                          createUserId: 332,
                          companyId: "9a380d3f-bf38-44a3-a3d4-38c12e964496",
                          branchId: 5));

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          double height = MediaQuery.of(context).size.height;
                          return AlertDialog(
                            title: SizedBox(
                              height: height * .01,
                            ),
                            content: const Text(
                              "Brand Deleted Successfully ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Okay"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))),
            TextButton(
              child: const Text("singleview"),
              onPressed: () {
                BlocProvider.of<BrandBloc>(context).add(
                    SingleViewEvent(companyID: "9a380d3f-bf38-44a3-a3d4-38c12e964496",
                        branchId: 1, brandName: titleController.text, notes: noteController.text, userID: 332));


              },
            ),
                    BlocBuilder<GetBloc, GetState>(
                      builder: (context, state) {
            if(state is GetLoaded) {
              getModelClass = BlocProvider.of<GetBloc>(context).getModelClass;

              return Container(
                height: mHieght*.5,
                color: Colors.red,
                child: ListView.builder(
                    itemCount: getModelClass.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                        //  leading: const Icon(Icons.add),
                          title:  Text(
                           getModelClass.data![index].countryName.toString()
                          ),
                         // trailing: const Icon(Icons.done),




                        ),
                      );
                    }
                ),
              );
            }
            if(state is GetLoading){
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
