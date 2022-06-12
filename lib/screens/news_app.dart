import 'package:akhbarapp/cubit/news_cubit.dart';
import 'package:akhbarapp/screens/business_screen/business_screen.dart';
import 'package:akhbarapp/screens/science_sceen/science_screen.dart';
import 'package:akhbarapp/screens/search_screen/search_screen.dart';
import 'package:akhbarapp/screens/sports_screen/sports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton(onPressed: () {
                 // newsCubit.getBusiness();
                 //newsCubit.SerachNews(value);
                 Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchScreen())));
                }, icon: Icon(Icons.search)), 
                IconButton(onPressed: (){

           NewsCubit.get(context).changeMode();
                }, icon: Icon(Icons.sunny)),
              ],
            ),
            body: newsCubit.screens[newsCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: newsCubit.currentIndex,
                onTap: (index) {
                  print(index);
                  // newsCubit.currentIndex = index;
                  newsCubit.updateIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: 'News',
                    icon: Icon(Icons.newspaper),
                  ),
                  BottomNavigationBarItem(
                      label: 'Science', icon: Icon(Icons.science)),
                  BottomNavigationBarItem(
                    label: 'Sports',
                    icon: Icon(Icons.sports),
                  ),
                ]),
          );
        });
  }
}
