import 'package:flutter/material.dart';

class SalesInvoice extends StatelessWidget {
  SalesInvoice({Key? key}) : super(key: key);
  String companyName = "ViknCodes LLP";
  String companyNameArabic = "وىن كودس";
  String companyPlace = "Poonoor";
  String companyPlaceArabic = "بونور";
  String taxNo = "6363623785678";
  String crNo = "6363623785";
  String dateAndTime = "DD/MM/YYYY , 5:17 PM";
  String billNo = "31312312";
  String tokenNumber = "123654";
  String serverType = "Take Out";
  String customerName = "Savad Farooque";
  String user = "Unais";
  String netTotal = "240";
  String totalQnt = "240";
  String  totalVat = "2400";
  String discountAmt = "2400";
  String grantTotal = "2400";
  String bankAmt = "2400";
  String cashReceived = "2400";
  String balance = "2400";
  final siNoList = [
    "01",
    "02",
    "03",
  ];
  final productDetailsList = [
    "Pizza\n"
        "وصف",
    "Pizza\n"
        "وصف",
    "Pizza\n"
        "وصف",
  ];
  final qntList = [
    "02",
    "3",
    "04"
  ];
  final rateList = [
    "240",
    "3000",
    "50000"
  ];
  final totalList = [
    "100",
    "10",
    "2000"
  ];

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;

    final design =   Container(
        padding:
        EdgeInsets.only(left: mHeight * .02, right: mHeight * .01),
        child: const Text( "....................................................................................."));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: mHeight * .02, left: mWidth * .04, right: mWidth * .04,bottom: mHeight*.04),
        height: mHeight,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                foregroundImage:
                    AssetImage("assets/profile_image/download.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: mHeight * .02),
              height: mHeight * .24,
              // color: Colors.grey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  companyName.isNotEmpty  ?
                  Text(
                    companyName,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )
                      :const SizedBox(),
                  companyNameArabic.isNotEmpty ?      Text(companyNameArabic,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 25)):const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      companyPlace.isNotEmpty ?    Text(
                        companyPlace,
                        style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 13),
                      ):const SizedBox(),
                      SizedBox(
                        width: mWidth * .01,
                      ),
                      companyPlaceArabic.isNotEmpty ?   Text(
                        companyPlaceArabic,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ) : const SizedBox(),
                    ],
                  ),
                  taxNo.isNotEmpty ?
                  TaxNoAndCrNoWidget(mHeight: mHeight, mWidth: mWidth, taxNo: taxNo, nmbrText: "Tax No:", nmbrTextArabic:  "الرقم الضريبي",):const SizedBox(),
                  crNo.isNotEmpty ?
                  TaxNoAndCrNoWidget(mHeight: mHeight, mWidth: mWidth, taxNo: crNo, nmbrText: "CR No:", nmbrTextArabic:  "رقم التسجيل الجمركي",):const SizedBox()
                ],
              ),
            ),
            SizedBox(
              // color: Colors.grey,
              height: mHeight * .1,
              child:  Column(
               // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Sales Invoice",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "فاتورة المبيعات",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mHeight * .1,
              // color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Date:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                      //    color: Colors.red,
                          width: mWidth*.55,

                          child: Text(dateAndTime)),
                      const Text(
                        ":رتاريخ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bill No:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                      //  color: Colors.red,
                        width: mWidth*.5,
                          child: Text(billNo,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                      const Text(
                        ":تاريختاريخ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            design,
            SizedBox(
              height: mHeight * .1,
              // color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Token No:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mWidth*.4,
                        //color: Colors.yellow,
                        child: Text(
                          tokenNumber,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Text(
                        ":رقم رمزيي",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Serve Type:",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mWidth*.38,
                       // color: Colors.yellow,
                        child: Text(
                          serverType,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Text(
                        ":نوع الخدمة",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            design,
            SizedBox(
              //  color: Colors.grey,
              height: mHeight * .16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomerDetailsSectionWidget(name: customerName, text: "Customer Name(اسم الزبون): "),
                  CustomerDetailsSectionWidget(name: user, text: "User(المستعمل): "),
                  CustomerDetailsSectionWidget(name: taxNo, text: "Tax No(الرقم الضريبي): "),
                  CustomerDetailsSectionWidget(name: crNo, text: "CR No(رقم التسجيل الجمركي): "),

                ],
              ),
            ),
            design,
            Container(
              padding: EdgeInsets.only(top: mHeight*.02),
              height: mHeight*.1,
           // width: mWidth*.7,
            //  color: Colors.grey,
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const ProductDetailWidget(text: "SI NO", arabicText: "عدد",),
                      const ProductDetailWidget(text: "Product Details", arabicText: "تفاصيل المنتج",),
                      SizedBox(width: mWidth*.02,),
                      const ProductDetailWidget(text: "Qty", arabicText:  "كمية",),
                      const ProductDetailWidget(text: "Rate", arabicText:  "معدل",),
                      const ProductDetailWidget(text: "Total", arabicText:  "مجموع",),







                    ],
                  ),



                ],
              ),
            ),
            design,
            ListView.builder(
              itemCount: siNoList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
              return SizedBox(
               height: mHeight*.06,
             //   color: Colors.yellow,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: mWidth*.03,),
                    Expanded(

                      flex:01,

                        child: Text(siNoList[index]),
                    ),
                    Expanded(
                      flex:02,

                      child: TextWidget(text: productDetailsList[index]),
                    ),
                    Expanded(
                      flex: 1,
                        child: Text(qntList[index],textAlign: TextAlign.end,)),
                   // SizedBox(width: mWidth*.04,),
                    Expanded(
                        flex:01,
                        child: Text(rateList[index],textAlign: TextAlign.end,)),
                    Expanded(
                        //flex: 011,
                        child: Text(totalList[index],textAlign: TextAlign.end,)),
                    //SizedBox(width: mWidth*.02,)


                  ],
                ),

              );
            }
            ),
         design,
            SizedBox(
          //    color: Colors.blue,
              height: mHeight*.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TotalWidget(totalText: 'Total Quantity - الكمية الإجمالية:', amount: totalQnt,),
                  TotalWidget(totalText: 'Net Total - تالاتسؤسؤت:', amount: netTotal,),
                  TotalWidget(totalText: 'Total VAT - تالاتسؤسؤت:', amount: totalVat,),
                  TotalWidget(totalText: 'Discount Amt - تالاتسؤسؤت:', amount: discountAmt,),
                  TotalWidget(totalText: 'Grant Total - تالاتسؤسؤت:', amount: grantTotal,fontWeight: FontWeight.w900,),
                ],
              ),
            ),
            design,
            SizedBox(
            //  color: Colors.blue,
              height: mHeight*.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  TotalWidget(totalText: 'Bank Amount - تالاتسؤسؤت:', amount: bankAmt,),
                  TotalWidget(totalText: 'Cash Recieved - تالاتسؤسؤت:', amount: cashReceived,),
                  TotalWidget(totalText: 'Balance - تالاتسؤسؤت:', amount: balance,fontWeight: FontWeight.w900,),

                ],
              ),
            ),
            design,
            SizedBox(
              height: mHeight*.1,
              child: const Center(
                child: Text("Note: sadipscing elitr, sed diam nonumy eirmod \n"
                    "Lorem ipsum dolor sit amet, consetetur"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key, required this.text, required this.arabicText,
  });
  final String text;
  final String arabicText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(text: text,),
        TextWidget(text: arabicText,),
      ],
    );
  }
}

class CustomerDetailsSectionWidget extends StatelessWidget {
  const CustomerDetailsSectionWidget({
    super.key,
    required this.name, required this.text,
  });

  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),maxLines: 2,),
        Text(name),
      ],
    );
  }
}

class TaxNoAndCrNoWidget extends StatelessWidget {
  const TaxNoAndCrNoWidget({
    super.key,
    required this.mHeight,
    required this.mWidth,
    required this.nmbrText,
    required this.taxNo,  required this.nmbrTextArabic,
  });

  final double mHeight;
  final double mWidth;
  final String nmbrText;
  final String nmbrTextArabic;
  final String taxNo;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: mHeight * .01),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.only(right: mWidth * .01),
                  child: Text(
                    nmbrText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  )),
              Text(
                taxNo,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: mHeight * .01, left: mWidth * .01),
          child: const Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        Text(
         nmbrTextArabic,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ],
    );
  }
}

class TotalWidget extends StatelessWidget {
   TotalWidget({
    super.key, required this.totalText, required this.amount,this.fontWeight
  });
  final String totalText;
  final String amount;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(totalText,style: TextStyle(fontSize: 15,fontWeight: fontWeight),),
        Text(amount,style: TextStyle(fontSize: 15,fontWeight: fontWeight))
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text  ,style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold),);
  }
}
