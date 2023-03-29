import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Ledger/ledger_bloc.dart';
import '../../../../Constens/constens.dart';
import '../../../../Functions/date_picker_function.dart';
import '../../../../Functions/exitbuttonfunction.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Functions/roundoff_function.dart';
import '../../../../TopUpApiSection/ModelClasses/Ledger/CreateLedgerModelClass.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';
import 'Edit Ledger/add_address_screen.dart';
import 'Edit Ledger/list_area_screen.dart';
import 'leger_group_list_screen.dart';

class CreateAndEditLedger extends StatefulWidget {
  CreateAndEditLedger(
      {Key? key,
      required this.type,
      this.id,
      this.accountGroupUnder,
      this.ledgerName,
      this.balance,
      this.asOnDate,

      this.phone,
      this.isVat,
      this.vatNo,
      this.address,
      this.areaId,
      this.areaName,
      this.email})
      : super(key: key);
  final String type;
  String? id;
  int? accountGroupUnder;
  String? ledgerName;
  String? balance;
  String? asOnDate;
  int? phone;
  bool? isVat;
  String? vatNo;
  String? address;
  String? areaId;
  String? areaName;
  String? email;

  @override
  State<CreateAndEditLedger> createState() => _CreateAndEditLedgerState();
}

class _CreateAndEditLedgerState extends State<CreateAndEditLedger> {
  late CreateLedgerModelClass createLedgerModelClass;

  // ValueNotifier<String> dateNotifier = ValueNotifier("");
  DateTime dateTime = DateTime.now();

  DateFormat dateFormat = DateFormat("dd/MM/yyy");
  DateFormat apiDateFormat = DateFormat("y-M-d");

  // late ValueNotifier<String> dateNotifier;
  late ValueNotifier<DateTime> dateNotifier;

  bool ledgerGroup = true;

  bool value = false;
  ValueNotifier<bool> ledgerGroups = ValueNotifier(true);

  ValueNotifier<bool> isChecked = ValueNotifier(false);
  int groupId = 10;
  int grpId = 29;
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController balanceController;
  late TextEditingController areaController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController vatNumberController;
  late TextEditingController controllerLedgerGroup;
  String areaId = "";

  @override
  void initState() {
    groupId = widget.type == "Edit" ?widget.accountGroupUnder!.toInt()  : groupId;
    areaId = widget.type == "Edit" ? widget.areaId.toString() : "";
    //  dateNotifier = ValueNotifier(dateFormat.format(dateTime).toString());
    //  dateNotifier = ValueNotifier(apiDateFormat.format(dateTime).toString());
    dateNotifier = ValueNotifier(DateTime.now());
    nameController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.ledgerName.toString() : "";
    controllerLedgerGroup = TextEditingController()
      ..text = widget.type == "Edit" ? widget.accountGroupUnder.toString() : "";
    balanceController = TextEditingController()
      ..text = widget.type == "Edit"
          ? widget.balance.toString()
          : roundStringWith("0");
    areaController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.areaName.toString() : "";
    phoneNumberController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.phone.toString() : "";
    emailController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.email.toString() : "";
    addressController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.address.toString() : "";
    vatNumberController = TextEditingController()
      ..text = widget.type == "Edit" ? widget.vatNo.toString() : "";

    // TODO: implement initState
    super.initState();
  }

  // ValueNotifier<int> buttonClickedTimes =ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
        BlocListener<LedgerBloc, LedgerState>(
          listener: (context, state) {
            if (state is LedgerCreateLoading) {
              const CircularProgressIndicator(
                color: Color(0xffB73312),
              );
            }
            if (state is LedgerCreateLoaded) {
              //  hideProgressBar();
              createLedgerModelClass =
                  BlocProvider.of<LedgerBloc>(context).createLedgerModelClass;
              Navigator.pop(context);
              BlocProvider.of<LedgerBloc>(context)
                  .add(ListLedgerEvent(search: ""));
              if (createLedgerModelClass.statusCode == 6001) {
                msgBtmDialogueFunction(
                    context: context,
                    textMsg: createLedgerModelClass.message.toString());
                BlocProvider.of<LedgerBloc>(context)
                    .add(ListLedgerEvent(search: ''));
              }

              if (state is LedgerCreateError) {
                //   hideProgressBar();
                const Text("Something went wrong");
              }
            }
          },
        ),
        // BlocListener<LedgerBloc, LedgerState>(
        //   listener: (context, state) {
        //     if (state is LedgerEditLoading) {
        //       const CircularProgressIndicator();
        //     }
        //     if (state is LedgerEditLoaded) {
        //       Navigator.pop(context);
        //       BlocProvider.of<LedgerBloc>(context).add(LedgerListEvent(search: ""));
        //
        //     }
        //     if (state is LedgerEditError) {
        //       const Text("Something went wrong");
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
          //  resizeToAvoidBottomInset: false,

          backgroundColor: backGroundColor,
          appBar: appBar(
              appBarTitle: widget.type == "Create"
                  ? '${widget.type} Ledger'
                  : '${widget.type} Ledger'),
          body: Container(
              padding: EdgeInsets.only(
                  left: mWidth * .05, right: mWidth * .05, top: mHeight * .01),
              height: mHeight,
              decoration: containerDecoration,
              child: Form(
                key: formKey,
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  TextFormFieldWidget(
                    textCapitalization: TextCapitalization.words,
                    readOnly: false,
                    obscureText: false,
                    controller: nameController,
                    labelText: "Ledger name",
                    textInputType: TextInputType.name,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter ledger name';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormFieldWidget(
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: controllerLedgerGroup,
                    readOnly: true,
                    enabled: widget.type == "Edit" ? false : true,

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

                      // result != null ? supplierController.text = result[0] : Null;
                      result != null
                          ? controllerLedgerGroup.text = result[0]
                          : Null;
                      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$result");
                      setState(() {
                        groupId = result[1];
                        grpId = result[1];
                      });

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
                        textCapitalization: TextCapitalization.none,
                        readOnly: false,
                        textInputAction: TextInputAction.done,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: balanceController,
                        labelText: "Balance",
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        list: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,8}')),
                        ],
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
                            child: Text(
                              "As if on",
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: dateNotifier,
                              builder: (BuildContext ctx, dateNewValue, _) {
                                //    dateNewValue = apiDateFormat.format(dateTime).toString();

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
                                      showDatePickerFunction(
                                          context, dateNotifier);
                                      //   dateNotifier = ValueNotifier( DateFormat().format(date);
                                      print(dateNotifier);
                                    },
                                    child: Text(
                                      dateFormat.format(dateNewValue),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ));
                              })
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      groupId == 10 || grpId == 29
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Supplier Details",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )),
                                TextFormFieldWidget(
                                  textCapitalization: TextCapitalization.none,
                                  readOnly: false,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  controller: phoneNumberController,
                                  labelText: "Phone",
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  textInputType: TextInputType.phone,
                                ),
                                TextFormFieldWidget(
                                    textCapitalization: TextCapitalization.none,
                                    readOnly: false,
                                    textInputAction: widget.type == "Create"
                                        ? TextInputAction.next
                                        : TextInputAction.done,
                                    obscureText: false,
                                    textInputType: TextInputType.multiline,
                                    controller: emailController,
                                    labelText: "Email",
                                    prefixIcon: Image.asset(
                                        "assets/profile_image/sendimage.png")),
                                TextFormFieldWidget(
                                  textCapitalization: TextCapitalization.words,
                                  readOnly: false,
                                  maxLines: null,
                                  textInputType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  obscureText: false,
                                  controller: addressController,
                                  labelText: "Address",
                                ),
                              ],
                            )
                          : SizedBox(),
                      grpId == 10
                          ? TextFormFieldWidget(
                              textCapitalization: TextCapitalization.words,
                              readOnly: true,
                              textInputType: TextInputType.none,
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListAreaScreeen()),
                                );
                                result != null
                                    ? areaController.text = result[0]
                                    : Null;
                                areaId = result[1];
                                print(result);
                                print(
                                    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$areaId");
                              },
                              suffixIcon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              controller: areaController,
                              labelText: 'Area',
                            )
                          : SizedBox(),
                      widget.type == "Create"
                          ? Column(children: [
                              SizedBox(
                                height: mHeight * .02,
                              ),
                              groupId == 29
                                  ? ValueListenableBuilder(
                                      valueListenable: isChecked,
                                      builder: (BuildContext context,
                                          bool newCheckValue, _) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4.0,
                                                          vertical: -4.0),

                                                  checkColor: Colors.white,
                                                  activeColor:
                                                      const Color(0xffA42910),
                                                  // fillColor: MaterialStateProperty.resolveWith(getColor),
                                                  value: newCheckValue,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onChanged: (value) {
                                                    isChecked.value =
                                                        !isChecked.value;
                                                  },
                                                ),
                                                Text("VAT Registered",
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                              ],
                                            ),
                                            newCheckValue
                                                ? TextFormFieldWidget(
                                                    textCapitalization:
                                                        TextCapitalization.none,
                                                    readOnly: false,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'This field is required';
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: false,
                                                    controller:
                                                        vatNumberController,
                                                    labelText: "VAT No",
                                                    textInputType:
                                                        TextInputType.number,
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: mHeight * .1,
                                            ),
                                          ],
                                        );
                                      })
                                  : SizedBox()
                            ])
                          : const SizedBox(),
                      widget.type == "Edit"
                          ? const AddressWidget()
                          : const SizedBox()
                    ],
                  )
                ]),
              )),
          floatingActionButton: floatingActionButton(
              context: context,
              color: Colors.green,
              icon: Icons.done,
              onPressed: () {
                if (formKey.currentState!.validate() == true &&
                    widget.type == "Create") {
                  BlocProvider.of<LedgerBloc>(context).add(CreateLedgerEvent(
                      ledgerName: nameController.text,
                      accountGroupUnder: groupId,
                      openingBalance: num.parse(balanceController.text).toInt(),
                      asnDate: apiDateFormat.format(dateNotifier.value),
                      address: addressController.text,
                      phone: phoneNumberController.text,
                      email: emailController.text,
                      isVat: isChecked.value,
                      vatNo: vatNumberController.text,
                      areaId: areaId));
                  print(
                      "##################################################${areaId}");
                }
                // formKey.currentState!.validate() == true ?
                // Navigator.pop(context): const SizedBox();
              })),
    );
  }
}

class AddressWidget extends StatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final particulars = ["Cash in hand"];

  ///
  bool valueFirst = true;
  ValueNotifier<int> buttonClickedTimes = ValueNotifier(0);

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
        Text("Addresses",
            style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                          leading: Transform(
                            transform: Matrix4.translationValues(-10, -10, 0.0),
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              activeColor: const Color(0xffB53211),
                              value: valueFirst,
                              onChanged: (value) {
                                setState(() {
                                  valueFirst = value!;
                                });
                              },
                            ),
                          ),
                          title: Transform(
                              transform:
                                  Matrix4.translationValues(-30, 12, 0.0),
                              child: Text(
                                "Home",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
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
                            child: Expanded(
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(
                                  "Kunnummal House  \n"
                                  "karakkkunn \n"
                                  "malappuram \n"
                                  "kerala \n"
                                  "676123\n"
                                  "Area",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 30, color: Colors.black)),
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
