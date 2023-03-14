import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Constens/constens.dart';
import '../../../../Functions/date_picker_function.dart';
import '../../../../Functions/floating_action_function.dart';
import '../../../../Widgets/appbar_widget.dart';
import '../../../../Widgets/text_form_field_widget.dart';
import 'Edit Ledger/edit_address_screen.dart';
import 'supplier_list_screen.dart';

class CreateLedgerScreen extends StatefulWidget {
  const CreateLedgerScreen({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<CreateLedgerScreen> createState() => _CreateLedgerScreenState();
}

class _CreateLedgerScreenState extends State<CreateLedgerScreen> {
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

  // ValueNotifier<String> dateNotifier = ValueNotifier("");
  DateTime dateTime = DateTime.now();

  DateFormat dateFormat = DateFormat("dd/MM/yyy");

  late ValueNotifier<String> dateNotifier;

  bool ledgerGroup = true;

  bool value = false;

  ValueNotifier<bool> isChecked = ValueNotifier(true);
  int groupId= 2;
  int grpId = 3;

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
        backgroundColor: backGroundColor,
        appBar: appBar(
            appBarTitle:
                widget.type == "Create" ? '${widget.type} Ledger' : '${widget.type} Ledger'),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          height: mHeight,
          decoration: containerDecoration,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              TextFormFieldWidget(
                obscureText: false,
                controller: nameController,
                labelText: "Ledger name",
                textInputType: TextInputType.name,
              ),
              TextFormFieldWidget(
                obscureText: false,

                // onChanged: (val){
                //  supplierController.text = val.toString();
                // },

                controller: supplierController,
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
                        builder: (context) => SupplierListScreen()),
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
                  var k= [1,2];
                  var a = k[0];
                  setState(() {
                    groupId = result[1];


                  });
                  setState(() {
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
                    obscureText: false,
                    controller: balanceController,
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
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text("As if on"),
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
                  const Text(
                    "Supplier Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  TextFormFieldWidget(
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
                      obscureText: false,
                      textInputType: TextInputType.multiline,
                      controller: emailController,
                      labelText: "Email",
                      prefixIcon:
                          Image.asset("assets/profile_image/sendimage.png")),
                  widget.type == "Create"
                      ? Column(
                          children: [
                            TextFormFieldWidget(
                              obscureText: false,
                              controller: addressController,
                              labelText: "Address",
                              maxLines: 5,
                              textInputType: TextInputType.text,
                            ),
                            SizedBox(
                              height: mHeight * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: isChecked,
                                    builder: (BuildContext context,
                                        bool newCheckValue, _) {
                                      return Checkbox(
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
                                      );
                                    }),
                                const Text("VAT Registered",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            TextFormFieldWidget(
                              obscureText: false,
                              controller: vatNumberController,
                              labelText: "VAT No",
                              textInputType: TextInputType.number,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  widget.type == "Edit" ? AddressWidget() : const SizedBox()
                ],
              )
                 : Container()
            ]
          )
        ),
        floatingActionButton: floatingActionButton(
            context: context,
            color: Colors.green,
            icon: Icons.done,
            onPressed: () {
              Navigator.pop(context);
            }));
  }
}

class AddressWidget extends StatelessWidget {
  AddressWidget({Key? key}) : super(key: key);
  final particulars = [
    "Cash in hand"];
  final decorationContainer = BoxDecoration(
      color: const Color(0xffF5F5F5), borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mHeight * .03,
        ),
        const Text(
          "Addresses",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: mHeight * .02,
        ),
        SizedBox(
            // color: Colors.grey,
            height: mHeight * .25,
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
                                      builder: (context) => EditAddresScreen()),
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
                        decoration: decorationContainer,
                        child: ListTile(
                          leading: const CircleAvatar(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xffB73312),
                              radius: 10,
                              child: Icon(
                                Icons.done,
                                size: 10,
                              )),
                          title: Transform(
                            transform: Matrix4.translationValues(-30, 12, 0.0),
                            child: const Text("Home",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
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
                            child: const Column(
                              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddressDetailsWidget(
                                  addressDetails: 'Kunnummal House',
                                  color: Colors.black,
                                ),
                                AddressDetailsWidget(
                                  addressDetails:
                                      'Karkkunnu, Thirakkalangod po',
                                  color: Colors.black,
                                ),
                                AddressDetailsWidget(
                                  addressDetails: 'Malppuram Destrict',
                                  color: Colors.black,
                                ),
                                AddressDetailsWidget(
                                  addressDetails: 'Kerala',
                                  color: Colors.black,
                                ),
                                AddressDetailsWidget(
                                  addressDetails: '765463',
                                  color: Colors.black,
                                ),
                                AddressDetailsWidget(
                                  addressDetails: 'Area',
                                  color: Color(0xffB53211),
                                ),
                              ],
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

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({
    super.key,
    required this.addressDetails,
    required this.color,
  });

  final String addressDetails;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      addressDetails,
      style: TextStyle(color: color),
    );
  }
}
