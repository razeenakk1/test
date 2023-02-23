import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/All_Api/create_api.dart';
import 'package:topuptest/Api_Section/All_Api/login_api.dart';
import 'package:topuptest/Api_Section/Bloc/BrandNameModel/brand_name_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/bannerBloc/banner_bloc.dart';
import 'package:topuptest/screens/Login_Screen/loginScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  UserApi userApi = UserApi();
  BrandApi brandApi = BrandApi();
  BannerApi bannerApi= BannerApi();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userApi),
        ),
        BlocProvider<BrandNameBloc>(
          create: (context) => BrandNameBloc(brandApi),
        ),
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(bannerApi),
        ),

      ],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: LoginScreen()
        ),

    );
  }
}
