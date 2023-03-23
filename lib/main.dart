import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/All_Api/get_api.dart';
import 'package:topuptest/Api_Section/All_Api/login_api.dart';
import 'package:topuptest/Api_Section/Bloc/BrandBloc/brand_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/LoginBloc/login_bloc.dart';
import 'package:topuptest/Api_Section/Bloc/get_bloc/get_bloc.dart';
import 'package:topuptest/ListAndSearch/Api_Section/Api_Function/product_list_api.dart';
import 'package:topuptest/ListAndSearch/Api_Section/Bloc/product_list_bloc.dart';
import 'package:topuptest/TopUpScreen/SplashScreen/splash_screen.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Api%20Function/Category/category_api.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Category/category_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/Tax/tax_bloc.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/Bloc/TopUpLoginBloc/top_up_login_bloc.dart';
import 'ListAndSearch/Api_Section/Api_Function/search_api.dart';
import 'TopUpScreen/CameraSecton/camera_screen.dart';
import 'TopUpScreen/TopUpApiSection/Api Function/Login_Api/login_api.dart';
import 'TopUpScreen/TopUpApiSection/Api Function/Tax_Api/tax_api.dart';


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
   final ProductListApi productListApi = ProductListApi();
   final ApiSearchProduct apiSearchProduct = ApiSearchProduct();
   final ApiLoginTopUp apiLoginTopUp = ApiLoginTopUp();
   final TaxApi taxApi = TaxApi();
   final CategoryApi categoryApi = CategoryApi();

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
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(productListApi,apiSearchProduct),
        ),
        BlocProvider<TopUpLoginBloc>(
          create: (context) => TopUpLoginBloc(apiLoginTopUp),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(categoryApi),
        ),


      ],
       child:
       MaterialApp(
          debugShowCheckedModeBanner: false,
           theme: ThemeData(
             indicatorColor:    Color(0xffB73312),
           ),
         home:   SplashScreen()),

    );
  }
}
