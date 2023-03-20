import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/date_picker_function.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';
import 'Edit Ledger/add_address_screen.dart';
import 'leger_group_list_screen.dart';

class CreateAndEditLedger extends StatefulWidget {
  const CreateAndEditLedger({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<CreateAndEditLedger> createState() => _CreateAndEditLedgerState();
}

class _CreateAndEditLedgerState extends State<CreateAndEditLedger> {
  TextEditingController nameController = TextEditingController()
    ..text = "Savad Farooque";

  TextEditingController supplierController = TextEditingController()
    ..text = "Supplier";

  TextEditingController balanceController = TextEditingController()
    ..text = "1121.00";

  TextEditingController phoneNumberController = TextEditingController()
    ..text = "+912365478965";

  TextEditingController emailController = TextEditingController()
    ..text = "savadfarooque@gmail.com";

  TextEditingController addressController = TextEditingController()
    ..text = "Kunnummal House \n"
        "karakkkunn \n"
        "malappuram \n"
        "kerala \n"
        "676123";

  TextEditingController vatNumberController = TextEditingController()
    ..text = "0126547896532";
  TextEditingController controller = TextEditingController();
  TextEditingController controllerLedgerGroup = TextEditingController();

  // ValueNotifier<String> dateNotifier = ValueNotifier("");
  DateTime dateTime = DateTime.now();

  DateFormat dateFormat = DateFormat("dd/MM/yyy");

  late ValueNotifier<String> dateNotifier;

  bool ledgerGroup = true;

  bool value = false;
  ValueNotifier<bool> ledgerGroups = ValueNotifier(true);

  ValueNotifier<bool> isChecked = ValueNotifier(false);
  int groupId= 2;
  int grpId = 3;
  final formKey = GlobalKey<FormState>();




  @override
  void initState() {
    dateNotifier = ValueNotifier(dateFormat.format(dateTime).toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //  resizeToAvoidBottomInset: false,

        backgroundColor: backGroundColor,
        appBar: appBar(
            appBarTitle:
                widget.type == "Create" ? '${widget.type} Ledger' : '${widget.type} Ledger'),
        body: Container(
          padding:  EdgeInsets.only(left: mWidth*.05, right:  mWidth*.05, top:  mHeight*.01),
          height: mHeight,
          decoration: containerDecoration,
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TextFormFieldWidget(
                  readOnly: false,
                  obscureText: false,
                  controller:   widget.type == "Create" ?controller  : nameController,
                  labelText: "Ledger name",
                  textInputType: TextInputType.name,
                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter ledger name';
                    }
                    return null;
                  }, textInputAction: TextInputAction.next,

                ),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,

                  obscureText: false,


                  validator: (val ) {
                    if (val == null || val.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },

                  controller:widget.type == "Create" ?controllerLedgerGroup  : supplierController,
                  readOnly: true,
                  labelText: "Ledger Group",
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LedgerGroupListScreen()),
                    );

                    //
                    //     var items = [
                    //       "asan",
                    // 1
                    //     ];
                    //     print(items);
                    // supplierController.text =items[0].toString();

                    //
                    //print(result);
                    result != null ? supplierController.text = result[0] : Null;
                     result != null ? controllerLedgerGroup.text = result[0] : Null;
                     setState(() {
                      groupId = result[1];
                      grpId = result[1];});



                  //  groupId = supplierController.text;
                    print(result);
                    print("1111111111111111$groupId");
                  },
                  textInputType: TextInputType.none,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: TextFormFieldWidget(
                          readOnly: false,

                          textInputAction: TextInputAction.done,

                          validator: (val ) {
                            if (val == null || val.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                      obscureText: false,
                      controller:widget.type == "Create" ?controller  : balanceController,
                      labelText: "Balance",
                      textInputType: TextInputType.number,
                    )),
                    SizedBox(
                      width: mWidth * .05,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text("As if on",style: GoogleFonts.poppins(),),
                        ),
                        ValueListenableBuilder(
                            valueListenable: dateNotifier,
                            builder: (BuildContext ctx, String dateNewValue, _) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    // minimumSize: const Size.fromHeight(30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    minimumSize: const Size(200, 40),
                                  ),
                                  onPressed: () {
                                    showDatePickerFunction(context, dateNotifier);
                                  },
                                  child: Text(
                                    dateNewValue,
                                    style: const TextStyle(color: Colors.white),
                                  ));
                            })
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: mHeight * .03,
                ),
        groupId == 2 || grpId == 3  ?
        Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Supplier Details",
                      style: GoogleFonts.poppins(textStyle: const
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                    TextFormFieldWidget(
                      readOnly: false,

                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      controller:widget.type == "Create" ?controller  : phoneNumberController,
                      labelText: "Phone",
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      textInputType: TextInputType.phone,
                    ),
                    TextFormFieldWidget(
                        readOnly: false,

                        textInputAction: widget.type  == "Create" ? TextInputAction.next :TextInputAction.done,
                        obscureText: false,
                        textInputType: TextInputType.multiline,
                        controller:   widget.type == "Create" ? controller  : emailController,
                        labelText: "Email",
                        prefixIcon:
                            Image.asset("assets/profile_image/sendimage.png")),
                    widget.type == "Create"
                        ? Column(
                            children: [
                              TextFormFieldWidget(
                                readOnly: false,
                                maxLines: null,
                                textInputType: TextInputType.multiline,

                                textInputAction: TextInputAction.newline,
                                obscureText: false,
                                controller: widget.type == "Create" ?controller  : addressController,
                                labelText: "Address",

                              ),
                              SizedBox(
                                height: mHeight * .02,
                              ),
                              ValueListenableBuilder(
                                  valueListenable: isChecked,
                                  builder: (BuildContext context,
                                      bool newCheckValue, _) {
                                    return    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                              visualDensity: const VisualDensity(
                                                  horizontal: -4.0, vertical: -4.0),

                                              checkColor: Colors.white,
                                              activeColor: const Color(0xffA42910),
                                              // fillColor: MaterialStateProperty.resolveWith(getColor),
                                              value: newCheckValue,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              onChanged: (value) {
                                                isChecked.value = !isChecked.value;
                                              },
                                            ),
                                              Text("VAT Registered",
                                              style: GoogleFonts.poppins(textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold))),
                                          ],
                                        ),
                                   newCheckValue ?     TextFormFieldWidget(
                                     readOnly: false,

                                     textInputAction: TextInputAction.done,
                                     validator: (val ) {
                                       if (val == null || val.isEmpty) {
                                         return 'This field is required';
                                       }
                                       return null;
                                     },

                                          obscureText: false,
                                          controller:widget.type == "Create" ?controller  : vatNumberController,
                                          labelText: "VAT No",
                                          textInputType: TextInputType.number,
                                        ) : const SizedBox(),
                                        SizedBox(height: mHeight*.1,),


                                      ],
                                    );

                                  }),

                            ],
                          )
                        : const SizedBox(),


                    widget.type == "Edit" ? const AddressWidget() : const SizedBox()
                  ],
                )
                   : Container()
              ]
            ),
          )
        ),
        floatingActionButton: floatingActionButton(
            context: context,
            color: Colors.green,
            icon: Icons.done,
            onPressed: () {
              formKey.currentState!.validate() == true ?
              Navigator.pop(context): const SizedBox();
            }));
  }
}

class AddressWidget extends StatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final particulars = [
    "Cash in hand"
  ]; ///
  bool valueFirst = true;
  ValueNotifier<int> buttonClickedTimes =ValueNotifier(0);
  // ValueNotifier<bool>



  final decorationContainer = BoxDecoration(
      color: const Color(0xffF5F5F5), borderRadius: BorderRadius.circular(10));
   List<String>? items;
 // "Kunnummal House Karkkunnu, Thirakkalangod po Malppuram Destrict Kerala 765463 Area";

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mHeight * .03,
        ),
         Text(
          "Addresses",
        style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        )),
        SizedBox(
          height: mHeight * .02,
        ),
        SizedBox(
            // color: Colors.grey,
            height: mHeight * .28,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: particulars.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (particulars.isEmpty || particulars.length == index) {
                    return Card(
                      elevation: 0,
                      child: Container(
                        decoration: decorationContainer,
                        width: mWidth * .7,
                        child: Center(
                          child: SizedBox(
                            height: mHeight * .1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffB53211),
                                shape: const CircleBorder(),
                                //  padding: const EdgeInsets.only(24),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddAddressScreen()),
                                );
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Card(
                      elevation: 0,
                      child: Container(
                        width: mWidth * .8,
                        height: mHeight * .1,
                        decoration: decorationContainer,
                        child: ListTile(
                          leading:  Transform(
                            transform: Matrix4.translationValues(-10, -10, 0.0),
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              activeColor: const Color(0xffB53211),
                              value: valueFirst,
                              onChanged: ( value) {
                                setState(() {
                                  valueFirst = value!;
                                });
                              },
                            ),
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-30, 12, 0.0),
                            child:  Text( "Home",
                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                            )),
                          trailing: Container(
                            margin: const EdgeInsets.only(bottom: 50),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                              ),
                            ),
                          ),
                          subtitle: Transform(
                            transform: Matrix4.translationValues(-30, 20, 0.0),
                            child:    Expanded(
                              child: FittedBox(
                                fit:BoxFit.fitHeight,

                                child: Text(
                                    "Kunnummal House  \n"
                                        "karakkkunn \n"
                                        "malappuram \n"
                                        "kerala \n"
                                        "676123\n"
                                        "Area" ,style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 30,color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                })),
        SizedBox(
          height: mHeight * .05,
        ),
      ],
    );
  }
}


