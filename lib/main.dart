import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/layout/news_app/news_layout.dart';
import 'package:untitled1/modules/test/log.dart';
import 'package:untitled1/modules/bmi/BMI_calculatotr.dart';
import 'package:untitled1/modules/bmi_result/bmi_result.dart';
import 'package:untitled1/modules/counter/counter.dart';
import 'package:untitled1/modules/home/home_screen.dart';
import 'package:untitled1/modules/login/login_screen.dart';
import 'package:untitled1/modules/login/login_screen2.dart';
import 'package:untitled1/modules/messenger/messenger_Screen.dart';
import 'package:untitled1/modules/users/users_screen.dart';
import 'package:untitled1/modules/test/register.dart';
import 'package:untitled1/shared/bloc_observer.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';
import 'package:untitled1/shared/network/local/cache_helper.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';

import 'layout/news_app/news_cubit/cubit.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark= CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

//class MyApp
class MyApp extends StatelessWidget
{
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewsCubit()..getBusiness()..getScience()..getSports(),),
          BlocProvider( create: (BuildContext context) => AppCubit()..changeAppMode(
            fromShared: isDark,
          ), ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, states){},
          builder: (context, states){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:  ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 40,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 40,
                  backgroundColor: HexColor('333739'),
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: NewsApp(),
            );
          },
        ),
      );
  }
}





