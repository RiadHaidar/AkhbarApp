import 'package:akhbarapp/cache_helper/cache_helper.dart';
import 'package:akhbarapp/cubit/states.dart';
import 'package:akhbarapp/network/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/business_screen/business_screen.dart';
import '../screens/science_sceen/science_screen.dart';
import '../screens/sports_screen/sports_screen.dart';

class NewsCubit extends BlocBase<NewsStates> {
  NewsCubit() : super(NewsInitializeNewsState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [BusinessScreen(), ScienceScreen(), SportsScreen()];
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    emit(NewsChangeScreenIndex());
  }

  static const String apiKey = '7eeaabf52e6f470b8d7019cdeff75724';

  List<dynamic> business = [];
// dynamic datax ;
  void getBusiness() {
    emit(NewsLoadingBusinessState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '${apiKey}'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      //   datax = business[0]['title'];

      //    print(value.data['status']);
      //   print(value.data['totalResults']);
      emit(NewsGetBusinessState());
    }).catchError((error) {
      print(error);
      emit(NewsErrorBusinessState(error));
      //  print(error);
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsLoadingSportssState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '${apiKey}'
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsState());
    }).catchError((error) {
      emit(NewsErrorSportsState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsLoadingSciencesState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '${apiKey}'
    }).then((value) {
      science = value.data['articles'];
    }).catchError((error) {
      emit(NewsErrorScienceState(error.toString()));
    });
  }

  bool isDark = false;
  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      CacheHelper.putData(key: 'isDark', value: isDark)
          .then((value) => emit(NewsAppChangeTheme()));
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark)
          .then((value) => emit(NewsAppChangeTheme()));
    }
  }

// Map<String, dynamic>search = {};
  List<dynamic> search = [];
  void SerachNews(input) async {
    await DioHelper.getData(url: 'v2/top-headlines', query: {
      'q': '${input}',
      'apiKey': '${apiKey}'
    }).then((value) {
      //search = value.
      search = value.data['articles'];
      emit(NewsSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsErrorSearcheState(error.toString()));
    });
  }
}
