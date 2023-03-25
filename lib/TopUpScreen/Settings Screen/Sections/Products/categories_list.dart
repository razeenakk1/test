import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Category/category_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CategoryListModelClass.dart';
import '../../../Constens/constens.dart';
import '../../../Functions/exitbuttonfunction.dart';
import '../../../Functions/floating_action_function.dart';
import '../../../TopUpApiSection/ModelClasses/Category/DeleteCategorModelClass.dart';
import '../../../TopUpApiSection/ModelClasses/Category/SingleViewCategoryModelClass.dart';
import '../../../Widgets/Custom_Overlay_Loader/custom_overlay_loader.dart';
import '../../../Widgets/appbar_widget.dart';
import '../../../Widgets/search_widget.dart';
import '../../Custom_Commen_Class_BottomSheet/commen_function.dart';
import '../Accounts/Ledgers_Secrion/ledgers_screen.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CommonBottomSheetClass commonBottomSheetClass =
      CommonBottomSheetClass();

  final TextEditingController searchController = TextEditingController();

  late CategoryListModelClass categoryListModelClass;
  late SingleViewCategoryModelClass singleViewCategoryModelClass;
  late  DeleteCategorModelClass deleteCategoryModelClass ;


  late ProgressBar progressBar;

  void showProgressBar() {
    progressBar.show(context);
  }

  void hideProgressBar() {
    progressBar.hide();
  }

  @override
  void dispose() {
    progressBar.hide();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(ListCategoryEvent(search: ''));
    progressBar = ProgressBar();

    // TODO: implement initState
    super.initState();
  }

  String? customId;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategorySingleViewLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is CategorySingleViewLoaded) {
              hideProgressBar();
              singleViewCategoryModelClass =
                  BlocProvider.of<CategoryBloc>(context)
                      .singleViewCategoryModelClass;

              commonBottomSheetClass .settingsBottomSheetFunction(
                  context: context, type: "Category", addOrEdit: 'Edit',
                  typeName:singleViewCategoryModelClass.data!.first.categoryName, id: customId);

              BlocProvider.of<CategoryBloc>(context)
                  .add(ListCategoryEvent(search: ''));
              if (state is CategorySingleViewError) {
                hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoryDeleteLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is CategoryDeleteLoaded) {
              hideProgressBar();
              BlocProvider.of<CategoryBloc>(context).add(ListCategoryEvent(search: ''));
              deleteCategoryModelClass =
                  BlocProvider.of<CategoryBloc>(context).deleteCategoryModelClass;
              if (deleteCategoryModelClass.statusCode == 6001) {
                msgBtmDialogueFunction(
                    context: context,
                    textMsg: deleteCategoryModelClass.message.toString());
              }

              if (state is CategoryDeleteError) {
                hideProgressBar();
              }
            }
          },
        )
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          appBar: appBar(appBarTitle: 'Categories'),
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
                      BlocProvider.of<CategoryBloc>(context)
                          .add(ListCategoryEvent(search: quary));
                    } else {
                      BlocProvider.of<CategoryBloc>(context)
                          .add(ListCategoryEvent(search: ""));
                    }
                  },
                ),
                SizedBox(height: mHeight * .01),
                Expanded(
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffB73312),
                          ),
                        );
                      }
                      if (state is CategoryListLoaded) {
                        categoryListModelClass =
                            BlocProvider.of<CategoryBloc>(context)
                                .categoryListModelClass;
                        return ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            categoryListModelClass.data!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        categoryListModelClass.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          showProgressBar();
                                          BlocProvider.of<CategoryBloc>(context)
                                              .add(SingleViewCategoryEvent(
                                                  id: categoryListModelClass
                                                      .data![index].id
                                                      .toString()));

                                          customId = categoryListModelClass
                                              .data![index].id
                                              .toString();
                                        },
                                        child: Dismissible(
                                          background: Container(
                                              color: Colors.red,
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              )),
                                          confirmDismiss: (DismissDirection
                                              direction) async {
                                            return await btmDialogueFunction(
                                                context: context,
                                                textMsg:
                                                    'Are you sure delete ?',
                                                fistBtnOnPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                secondBtnPressed: () {
                                                  showProgressBar();

                                                  BlocProvider.of<CategoryBloc>(context)
                                                      .add(DeleteCategoryEvent(id: categoryListModelClass.data![index].id.toString()
                                                  ));
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                secondBtnText: 'Delete');
                                          },
                                          key: Key(categoryListModelClass
                                              .data!.length
                                              .toString()),
                                          onDismissed: (direction) {
                                            showProgressBar();


                                            BlocProvider.of<CategoryBloc>(context)
                                                .add(DeleteCategoryEvent(id: categoryListModelClass.data![index].id.toString()
                                            ));
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
                                                      categoryListModelClass
                                                                  .data![index]
                                                                  .categoryName !=
                                                              null
                                                          ? categoryListModelClass
                                                              .data![index]
                                                              .categoryName
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
                      if (state is CategoryListError) {
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
          floatingActionButton: floatingActionButton(
              context: context,
              color: const Color(0xffB73312),
              icon: Icons.add,
              onPressed: () {
                commonBottomSheetClass.settingsBottomSheetFunction(
                    context: context, type: "Category", addOrEdit: 'Add');
              })),
    );
  }
}
