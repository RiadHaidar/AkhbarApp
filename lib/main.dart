import 'package:akhbarapp/screens/news_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'cache_helper/cache_helper.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/news_cubit.dart';
import 'cubit/states.dart';
import 'network/dio.dart';



void main() 
{
  BlocOverrides.runZoned(
 
    () async {
       WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
     await CacheHelper.init();
      

    bool? isDark=  CacheHelper.getData(key: 'isDark');

        runApp(MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}


class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit()..changeMode(fromShared: isDark)..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(

        listener: (context, state) {
          
        },
        builder: (context,state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData( 
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme( 
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle( 
                color: Colors.black, 
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              systemOverlayStyle: SystemUiOverlayStyle( 
                statusBarColor: Colors.white, 
                statusBarIconBrightness: Brightness.dark, 
                
              ),
              backgroundColor:Colors.white, 
              elevation: 0.0,
            ), 
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed, 
            selectedItemColor: Colors.green, 
            elevation: 20.0,
          ), 
          textTheme:  TextTheme(  
            bodyText1:TextStyle(fontSize: 15.0 , 
            fontWeight: FontWeight.w600 , 
            color: Color.fromARGB(190, 158, 158, 158)) ,
            bodyText2: TextStyle(fontSize: 21.0 , 
            fontWeight: FontWeight.w600 , 
            color: Colors.black), 
           
              
           ),),
          
        darkTheme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 21.0 , 
            fontWeight: FontWeight.w600 , 
            color: Colors.white)
           ),
          scaffoldBackgroundColor: HexColor('333739'), 
         primarySwatch: Colors.green,
            appBarTheme: AppBarTheme( 
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle( 
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              systemOverlayStyle: SystemUiOverlayStyle( 
                statusBarColor: HexColor('333739'), 
                statusBarIconBrightness: Brightness.dark, 
                
              ),
              backgroundColor:HexColor('333739'), 
              elevation: 0.0,
            ), 
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
            type: BottomNavigationBarType.fixed, 
            selectedItemColor: Colors.green, 
            unselectedItemColor: Colors.white,
            elevation: 20.0,),
        ),
        themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
          home: NewsApp()),
      ),
    );
  }
}