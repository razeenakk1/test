import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  //TextEditingController percentageCalculatingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _formFieldKey = GlobalKey<FormFieldState>();
  final _formFieldKey1 = GlobalKey<FormFieldState>();
  final _formFieldKey2 = GlobalKey<FormFieldState>();
  double percentageCalculating = 0;

  @override
  //final totalAmount  = totalAmountController.text;

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(
      height: MediaQuery.of(context).size.height * .02,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                key: _formFieldKey,
                onChanged: (val) {
                  (_formFieldKey.currentState!.validate());
                  calculate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a number";
                  }
                  return null;

                  // if (!RegExp(
                  //         r'^*(?:\+?())?[-. (]*()[-. )]*()[-. ]*()(?: *x())?$')
                  //     .hasMatch(value)) {
                  //   return " Enter digit number only";
                  // }
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
              space,
              TextFormField(
                textInputAction: TextInputAction.next,
                key: _formFieldKey1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a number";
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: quantityController,
                onChanged: (val) {
                  (_formFieldKey1.currentState!.validate());
                  calculate();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantity',
                ),
              ),
              space,
              TextFormField(
                enabled: false,
                controller: totalAmountController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  calculate();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TotalAmount',
                ),
              ),
              space,
              TextFormField(
                key: _formFieldKey2,
                onChanged: (val) {
                  (_formFieldKey2.currentState!.validate());
                  calculate();
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a percentage number";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: percentageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Percentage',
                ),
              ),
              space,
              // TextFormField(
              //   enabled: false,
              //   inputFormatters: <TextInputFormatter>[
              //     FilteringTextInputFormatter.digitsOnly
              //   ],
              //   keyboardType: TextInputType.number,
              //   onChanged: (val) {
              //     calculate();
              //   },
              //   controller: percentageCalculatingController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'GrandTotal',
              //   ),
              // ),

              Text(
                "Grand Total : $percentageCalculating",
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculate() {
    final firstValue = int.parse(amountController.text);
    final secondValue = int.parse(quantityController.text);
    totalAmountController.text = (firstValue * secondValue).toString();
    final totalAmount = int.parse(totalAmountController.text);
    final percentageValue = int.parse(percentageController.text);
    //   percentageCalculatingController.text = percentageTotal.toString();

    final percentageTotal = (totalAmount * percentageValue) / 100;
    percentageCalculating = percentageTotal;
    setState(() {
      percentageCalculating;
    });
  }
}
