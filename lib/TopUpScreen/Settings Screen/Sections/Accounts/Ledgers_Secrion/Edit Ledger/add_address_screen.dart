import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Ledger/ledger_bloc.dart';

import '../../../../../Constens/constens.dart';
import '../../../../../TopUpApiSection/ModelClasses/Ledger/AddressModelClass/CreateAddressModelClass.dart';
import '../../../../../TopUpApiSection/ModelClasses/Ledger/AddressModelClass/EditAddressModelClass.dart';
import '../../../../../Widgets/appbar_widget.dart';
import '../../../../../Widgets/bottom_sheet_button_widget.dart';
import '../../../../../Widgets/text_form_field_widget.dart';
import 'list_area_screen.dart';

class AddAddressScreen extends StatefulWidget {
   AddAddressScreen({Key? key, required this.type, required this.ledgerId,this.name,this.address,this.areaName,this.areaSid,this.addressId}) : super(key: key);
   final String type;
   final String ledgerId;
   String? name;
   String? address;
   String? areaName;
   String? areaSid;
   String? addressId;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController areaController;
  late  EditAddressModelClass editAddressModelClass ;
  late CreateAddressModelClass createAddressModelClass ;


  final formKey = GlobalKey<FormState>();

  dynamic areaValue;

   String areaId = "";

@override
  void initState() {
  areaId =  widget.type == "Edit"? widget.areaSid.toString() : areaId;
  nameController = TextEditingController()..text = widget.type == "Edit"? widget.name.toString() :"";
  addressController = TextEditingController()..text = widget.type == "Edit"? widget.address.toString() :"";
  areaController = TextEditingController()..text = widget.type == "Edit"? widget.areaName.toString() :"";

  // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
        BlocListener<LedgerBloc, LedgerState>(
          listener: (context, state) {
            if (state is AddressCreateLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is AddressCreateLoaded) {
              //  hideProgressBar();
              createAddressModelClass =
                  BlocProvider.of<LedgerBloc>(context).createAddressModelClass;
              BlocProvider.of<LedgerBloc>(context)
                  .add(SingleViewLedgerEvent(
                  id: widget.addressId.toString()));
              Navigator.pop(context);

              // if (createLedgerModelClass.statusCode == 6001) {
              //   msgBtmDialogueFunction(
              //       context: context,
              //       textMsg: createLedgerModelClass.message.toString());
              //   BlocProvider.of<LedgerBloc>(context)
              //       .add(LedgerListEvent(search: ""));
              // }


              if (state is AddressCreateError) {
                //   hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        BlocListener<LedgerBloc, LedgerState>(
          listener: (context, state) {
            if (state is AddressEditLoading) {
              const CircularProgressIndicator();
            }
            if (state is AddressEditLoaded) {
              Navigator.pop(context);
             // BlocProvider.of<LedgerBloc>(context).add(LedgerListEvent(search: ""));

            }
            if (state is AddressEditError) {
              const Text("Something went wrong");
            }
          },
        ),
      ],
      child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: appBar(appBarTitle: 'Edit Ledger'),
          body: Card(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              height: mHeight,
              child: Form(
                key: formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text("${widget.type} Address",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        )),
                    TextFormFieldWidget(
                      textCapitalization: TextCapitalization.words,

                      readOnly: false,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      autoFocus: true,
                      obscureText: false,
                      controller: nameController,
                      labelText: 'Name',
                      textInputType: TextInputType.name,
                    ),
                    TextFormFieldWidget(
                      textCapitalization: TextCapitalization.words,

                      maxLines: null,
                      textInputType: TextInputType.multiline,

                      textInputAction: TextInputAction.newline,
                      readOnly: false,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: addressController,
                      labelText: 'Address',
                    ),
                  TextFormFieldWidget(
                          textCapitalization: TextCapitalization.words,

                          readOnly: true,
                          textInputType: TextInputType.none,
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListAreaScreeen()),
                            );
                            result != null ? areaController.text = result[0] : Null;
                            areaId = result[2];
                            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$areaId");

                          },
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          textInputAction: TextInputAction.done,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          obscureText: false,
                          controller: areaController,
                          labelText: 'Area',
                        ),

                    ButtonWidget(onPressed: () {
                      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$areaId");
                      if (formKey.currentState!.validate() == true &&
                          widget.type == "Add") {
                        BlocProvider.of<LedgerBloc>(context).add(
                            CreateAddressEvent(
                                areaId: areaId, ledgerId:widget.ledgerId , home: nameController.text, address: addressController.text));
                      } if (formKey.currentState!.validate() == true &&
      widget.type == "Edit") {
                        BlocProvider.of<LedgerBloc>(context).add(
                          EditAddressEvent(areasId: areaId, addressName: nameController.text, address: addressController.text, addressId:widget.addressId.toString()));
                      }


                    })
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
