import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/All_Api/get_api.dart';

import 'package:topuptest/Api_Section/All_Api/login_api.dart';
import 'package:topuptest/Api_Section/Bloc/BrandBloc/brand_bloc.dart';

import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/get_bloc/get_bloc.dart';

import 'package:topuptest/screens/Login_Screen/loginScreen.dart';
import 'package:topuptest/screens/profile_screen.dart';
import 'package:topuptest/screens/sample_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  UserApi userApi = UserApi();
  BrandApi brandApi = BrandApi();
   GetApi getApi = GetApi();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userApi),
        ),

        BlocProvider<BrandBloc>(
          create: (context) => BrandBloc(brandApi),
        ),
        BlocProvider<GetBloc>(
          create: (context) => GetBloc(getApi),
        ),


      ],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: ProfileScreen()
        ),

    );
  }
}
