import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
                  Expanded(
                      flex: 25,
                      child: Column(children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  color: Colors.cyan,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.pink,
                          ),
                        )
                      ])),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                    ),
                  )
                ]))));
  }
}
