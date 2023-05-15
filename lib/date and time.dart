import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'TopUpScreen/Functions/date_picker_function.dart';


class DateAndTime extends StatelessWidget {
   DateAndTime({Key? key}) : super(key: key);

   ValueNotifier<DateTime>    dateNotifier = ValueNotifier(DateTime.now());

   ValueNotifier<DateTime>    timeNotifier = ValueNotifier(DateTime.now());

   String time = "pick";

   DateFormat timeFormat = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:                Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
            borderRadius: BorderRadius.circular(10)
          ),

          width: MediaQuery.of(context).size.width*.45,
          height: MediaQuery.of(context).size.height*.06,
          child: Row(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              ValueListenableBuilder(
                  valueListenable: dateNotifier,
                  builder:
                      (BuildContext ctx, dateNewValue, _) {
                  return GestureDetector(
                    onTap: (){
                      showDatePickerFunction(
                          context, dateNotifier);

                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                    //  color: Colors.orange,
                      width: MediaQuery.of(context).size.width*.21,
                      child:Text(
                        dateFormat.format(dateNewValue),
                        style: const TextStyle(
                            color: Colors.white),
                      ) ,

                    ),
                  );
                }
              ),


              ValueListenableBuilder(
                  valueListenable: timeNotifier,
                  builder:
                      (BuildContext ctx, timeNewValue, _) {
                  return Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width*.2,
                    child: TextButton(
                      onPressed: () async {
                        TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if(pickedTime != null ){

                          timeNotifier.value = DateFormat.jm().parse(pickedTime.format(context).toString());
                        }else{
                          print("Time is not selected");
                        }
                      },

                      child: Text(
                        timeFormat.format(timeNewValue),
                        style: const TextStyle(
                            color: Colors.white),
                      ),
                    ),

                  );
                }
              )

            ],
          ),

        ),
      ),
    );
  }
}
