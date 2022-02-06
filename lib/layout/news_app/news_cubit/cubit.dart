import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/news_cubit/states.dart';
import 'package:untitled1/modules/business/business_screen.dart';
import 'package:untitled1/modules/science/science_screen.dart';
import 'package:untitled1/modules/sports/sports_screen.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon:Icon(
          Icons.business,
        ),
        label: 'Business',

    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.sports,
        ),
        label: 'Sports',

    ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.science,
        ),
        label: 'Science',

    ),
  ];

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];


  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index == 1 )
      getSports();
    if(index == 2 )
      getScience();
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value.data['totalResults']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsScienceLoadingState());
    if(science.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['totalResults']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsSportsLoadingState());
    if(sports.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['totalResults']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
      {
        emit(NewsGetSportsSuccessState());
      }

  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value.data['totalResults']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

}
