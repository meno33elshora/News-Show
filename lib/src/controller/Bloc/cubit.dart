import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_show/src/controller/Bloc/state.dart';

import '../../view/pages/business.dart';
import '../../view/pages/healthy.dart';
import '../../view/pages/science.dart';
import '../../view/pages/setting.dart';
import '../../view/pages/sports.dart';
import '../../view/pages/technology.dart';
import '../network/remote.dart';
import '../services/endPoints.dart';

class NewsCubit extends Cubit<NewsStates> {
  // NewsCubit(super.initialState);
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void select(int n) {
    for (int i = 0; i < 6; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangePageNewsState());
  }

  final PageController pageController = PageController();

  List<bool> selected = [true, false, false, false, false, false];

  bool lastItem = false;
  bool allWidth = false;

  List<IconData> icon = [
    Icons.business,
    Icons.science,
    Icons.satellite,
    Icons.health_and_safety,
    Icons.sports_baseball,
    Icons.settings,
  ];
  List<Widget> screen = const [
    Business(),
    Technology(),
    Science(),
    Healthy(),
    Sports(),
    Setting(),
  ];

  List<dynamic> business = [];
  void getBusiness(){
    emit(NewsBusinessGetLoading());
    DioHelper.getData(
      url: URL,
      query: {
      COUNTRY  : COUNTRY1,
      CATEGORY : CATEGORY1,
      APIKEY : APIKEY1,
    }).then((value) {
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsBusinessGetSuccess());
    }).catchError((error){
      print(error);
      emit(NewsBusinessGetError(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience(){
    emit(NewsScienceGetLoading());
    if(science.length ==0){
      DioHelper.getData(url: URL, query: {
        COUNTRY  : COUNTRY1,
        CATEGORY : CATEGORY2,
        APIKEY : APIKEY1,
      }).then((value) {
        science = value?.data['articles'];
        print(science[0]['title']);
        emit(NewsScienceGetSuccess());
      }).catchError((error){
        print(error);
        emit(NewsScienceGetError(error.toString()));
      });
    }else{
      emit(NewsScienceGetSuccess());
    }
  }

  List<dynamic> technology = [];
  void getTechnology(){
    emit(NewsTechnologyGetLoading());
    if(technology.length ==0){
      DioHelper.getData(url: URL, query: {
        COUNTRY  : COUNTRY1,
        CATEGORY : CATEGORY3,
        APIKEY : APIKEY1,
      }).then((value) {
        technology = value?.data['articles'];
        print(technology[0]['title']);
        emit(NewsTechnologyGetSuccess());
      }).catchError((error){
        print(error);
        emit(NewsScienceGetError(error.toString()));
      });
    }else{
      emit(NewsTechnologyGetSuccess());
    }
  }

  List<dynamic> healthy = [];
  void getHealthy(){
    emit(NewsHealthyGetLoading());
    if(healthy.length ==0){
      DioHelper.getData(url: URL, query: {
        COUNTRY  : COUNTRY1,
        CATEGORY : CATEGORY4,
        APIKEY : APIKEY1,
      }).then((value) {
        healthy = value?.data['articles'];
        print(healthy[0]['title']);
        emit(NewsHealthyGetSuccess());
      }).catchError((error){
        print(error);
        emit(NewsScienceGetError(error.toString()));
      });
    }else{
      emit(NewsHealthyGetSuccess());
    }
  }

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsSportsGetLoading());
    if(sports.length ==0){
      DioHelper.getData(url: URL, query: {
        COUNTRY  : COUNTRY1,
        CATEGORY : CATEGORY5,
        APIKEY : APIKEY1,
      }).then((value) {
        sports = value?.data['articles'];
        print(sports[0]['title']);
        emit(NewsSportsGetSuccess());
      }).catchError((error){
        print(error);
        emit(NewsScienceGetError(error.toString()));
      });
    }else{
      emit(NewsSportsGetSuccess());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value){
    emit(NewsSearchGetLoading());
    // if(search.length ==0){
      DioHelper.getData(url: URL, query: {
        // COUNTRY  : COUNTRY1,
        'q' : value,
        APIKEY : APIKEY1,
      }).then((value) {
        search = value?.data['articles'];
        print(search[0]['title']);
        emit(NewsSearchGetSuccess());
      }).catchError((error){
        print(error);
        emit(NewsSearchGetError(error.toString()));
      });
    // }else{
    //   emit(NewsSearchGetSuccess());
    // }
  }
}
