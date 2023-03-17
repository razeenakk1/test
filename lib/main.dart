import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/All_Api/get_api.dart';
import 'package:topuptest/Api_Section/All_Api/login_api.dart';
import 'package:topuptest/Api_Section/Bloc/BrandBloc/brand_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/get_bloc/get_bloc.dart';
import 'package:topuptest/TopUpScreen/Login_Screen/login_screen.dart';
import 'package:topuptest/TopUpScreen/MainScreen/main_screen.dart';
import 'package:topuptest/TopUpScreen/SplashScreen/splash_screen.dart';
import 'package:topuptest/screens/HomeScreen/homeScreen.dart';
import 'package:topuptest/share_example.dart';
import 'TopUpScreen/CameraSecton/camera_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final  UserApi userApi = UserApi();
   final BrandApi brandApi = BrandApi();
   final  GetApi getApi = GetApi();

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
        ),],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.blue,),
         home:   const SplashScreen()

         // initialRoute: "/splashScreen",
         // routes: {
         //   '/splashScreen': (context) => SplashScreen(),
         //   '/loginScreen': (context) => LoginScreen(),
         //   '/': (context) => MainScreen(
         //     initialPageIndex: 0,
         //   ),
         //   '/dashBord': (context) => MainScreen(
         //     initialPageIndex: 0,
         //   ),
         //   '/menu': (context) => MainScreen(
         //     initialPageIndex: 1,
         //   ),
         //   '/menuScreen': (context) => MainScreen(
         //     initialPageIndex: 2,
         //   ),
         //   '/profile': (context) => MainScreen(
         //     initialPageIndex: 3,
         //   ),
         //   '/settings': (context) => MainScreen(
         //     initialPageIndex: 4,
         //   ),
         //
         // },
        ),

    );
  }
}
