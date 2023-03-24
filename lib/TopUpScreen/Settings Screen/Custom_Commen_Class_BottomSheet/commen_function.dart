import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Area/area_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Category/category_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Group/group_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CreateCategoryModlClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/CreateGroupModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Group/EditGroupModelClass.dart';

import '../../Functions/exitbuttonfunction.dart';
import '../../TopUpApiSection/ModelClasses/Area/CreateAreaModelClass.dart';
import '../../TopUpApiSection/ModelClasses/Category/EditCategoryModelClass.dart';
import '../../Widgets/bottom_sheet_button_widget.dart';
import '../../Widgets/text_field_widget.dart';

class CommonBottomSheetClass {
  final formKey = GlobalKey<FormState>();
  late CreateCategoryModlClass createCategoryModelClass;
  late EditCategoryModelClass editCategoryModelClass;
  late CreateGroupModelClass createGroupModelClass;
  late EditGroupModelClass editGroupModelClass;
  late CreateAreaModelClass createAreaModelClass;

  settingsBottomSheetFunction(
      {required BuildContext context,
      required String type,
      required String addOrEdit,
      String? typeName,
      String? id}) {
    TextEditingController controller = TextEditingController()
      ..text = typeName.toString();
    TextEditingController controllerNotValue = TextEditingController();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryCreateLoading) {
                  const CircularProgressIndicator();
                }
                if (state is CategoryCreateLoaded) {
                  createCategoryModelClass =
                      BlocProvider.of<CategoryBloc>(context)
                          .createCategoryModelClass;
                  if (createCategoryModelClass.statusCode == 6000) {
                    controllerNotValue.clear();
                    Navigator.pop(context);
                    BlocProvider.of<CategoryBloc>(context)
                        .add(ListCategoryEvent(search: ''));
                  }
                  if (createCategoryModelClass.statusCode == 6001) {
                    msgBtmDialogueFunction(
                        context: context,
                        textMsg: createCategoryModelClass.message.toString());
                    BlocProvider.of<CategoryBloc>(context)
                        .add(ListCategoryEvent(search: ''));
                  }
                }
                if (state is CategoryCreateError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryEditLoading) {
                  const CircularProgressIndicator();
                }
                if (state is CategoryEditLoaded) {
                  Navigator.pop(context);
                  BlocProvider.of<CategoryBloc>(context)
                      .add(ListCategoryEvent(search: ''));
                }
                if (state is CategoryEditError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<GroupBloc, GroupState>(
              listener: (context, state) {
                if (state is GroupCreateLoading) {
                  const CircularProgressIndicator();
                }
                if (state is GroupCreateLoaded) {
                  createGroupModelClass =
                      BlocProvider.of<GroupBloc>(context).createGroupModelClass;
                  if (createGroupModelClass.statusCode == 6000) {
                    controllerNotValue.clear();
                    Navigator.pop(context);
                    BlocProvider.of<GroupBloc>(context)
                        .add(ListGroupEvent(search: ''));
                  }
                  if (createGroupModelClass.statusCode == 6001) {
                    msgBtmDialogueFunction(
                        context: context,
                        textMsg: createGroupModelClass.message.toString());
                    BlocProvider.of<GroupBloc>(context)
                        .add(ListGroupEvent(search: ''));
                  }
                }
                if (state is GroupCreateError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<GroupBloc, GroupState>(
              listener: (context, state) {
                if (state is GroupEditLoading) {
                  const CircularProgressIndicator();
                }
                if (state is GroupEditLoaded) {
                  Navigator.pop(context);
                  BlocProvider.of<GroupBloc>(context)
                      .add(ListGroupEvent(search: ''));
                }
                if (state is GroupEditError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<AreaBloc, AreaState>(
              listener: (context, state) {
                if (state is AreaCreateLoading) {
                  const CircularProgressIndicator();
                }
                if (state is AreaCreateLoaded) {
                  createAreaModelClass =
                      BlocProvider.of<AreaBloc>(context).createAreaModelClass;
                  if (createAreaModelClass.statusCode == 6000) {
                    controllerNotValue.clear();
                    Navigator.pop(context);
                    BlocProvider.of<AreaBloc>(context)
                        .add(ListAreaEvent(search: ''));
                  }
                  if (createAreaModelClass.statusCode == 6001) {
                    msgBtmDialogueFunction(
                        context: context,
                        textMsg: createAreaModelClass.message.toString());
                    BlocProvider.of<AreaBloc>(context)
                        .add(ListAreaEvent(search: ''));
                  }
                }
                if (state is AreaCreateError) {
                  const Text("Something went wrong");
                }
              },
            ),
            BlocListener<AreaBloc, AreaState>(
              listener: (context, state) {
                if (state is AreaEditLoading) {
                  const CircularProgressIndicator();
                }
                if (state is AreaEditLoaded) {
                  Navigator.pop(context);
                  BlocProvider.of<AreaBloc>(context)
                      .add(ListAreaEvent(search: ''));
                }
                if (state is AreaEditError) {
                  const Text("Something went wrong");
                }
              },
            ),
          ],
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextWidget(text: "$addOrEdit $type"),
                    TextFieldWidget(
                      textInputType:  TextInputType.text,
                      controller:
                          addOrEdit == 'Add' ? controllerNotValue : controller,
                      labelText: 'Enter $type Name',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    ButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            type == "Category" &&
                            addOrEdit == "Add") {
                          BlocProvider.of<CategoryBloc>(context).add(
                              CreateCategoryEvent(
                                  categoryName: controllerNotValue.text));
                        }
                        if (formKey.currentState!.validate() &&
                            type == "Category" &&
                            addOrEdit == "Edit") {
                          BlocProvider.of<CategoryBloc>(context).add(
                              EditCategoryEvent(
                                  id: id.toString(),
                                  categoryName: controller.text));
                        }
                        if (formKey.currentState!.validate() &&
                            type == "Group" &&
                            addOrEdit == "Add") {
                          BlocProvider.of<GroupBloc>(context).add(
                              CreateGroupEvent(
                                  productGroupName: controllerNotValue.text));
                        }
                        if (formKey.currentState!.validate() &&
                            type == "Group" &&
                            addOrEdit == "Edit") {
                          BlocProvider.of<GroupBloc>(context).add(
                              EditGroupEvent(
                                  id: id.toString(),
                                  productGroupName: controller.text));
                        }
                        if (formKey.currentState!.validate() &&
                            type == "Area" &&
                            addOrEdit == "Add") {
                          BlocProvider.of<AreaBloc>(context).add(
                              CreateAreaEvent(
                                  areaName: controllerNotValue.text));
                        }
                        if (formKey.currentState!.validate() &&
                            type == "Area" &&
                            addOrEdit == "Edit") {
                          BlocProvider.of<AreaBloc>(context).add(EditAreaEvent(
                              id: id.toString(), areaName: controller.text));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

//
// openCommonBottomSheetController(
//     {required BuildContext context,
//     required String type,
//     required GlobalKey<ScaffoldState> scaffoldKey}) {
//   scaffoldKey.currentState!.showBottomSheet((BuildContext ctx) {
//     return Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: SingleChildScrollView(
//         child: Container(
//          // color: Colors.white,
//           padding:
//               const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextWidget(
//                     text: type == "Area" ? "Add Area" : "Create $type"),
//                 TextFieldWidget(
//                   controller: controller,
//                   labelText: 'Enter $type Name',
//                 ),
//                 ButtonWidget(
//                 onPressed:   () {
//                   // check type and pass each suit controller  in api
//                 },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   });
// }

// void commonFloatingActionButtonBottomSheetFunction(
//     {required BuildContext context, required String type}) {
//   showModalBottomSheet(
//     elevation: 30,
//       isScrollControlled: true,
//       isDismissible: true,
//       context: context,
//       builder: (ctx) {
//         final MediaQueryData mediaQueryData = MediaQuery.of(context);
//         return
//           Padding(
//             padding: mediaQueryData.viewInsets,
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20.0, vertical: 20.0),
//                 child: Form(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextWidget(text: type == "Area" ? "Add Area" :"Create $type"),
//                       TextFieldWidget(
//                         controller: controller,
//                         labelText: 'Enter $type Name',
//                       ),
//                       ButtonWidget(
//                         onPressed: () {
//
//
//                         },
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//       });
// }
}

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
    );
  }
}
