import 'package:news_show/src/view/utils/app_strings.dart';

class OnBoardingModel {
  String? title;
  String? body;
  String? image;

  OnBoardingModel(
      {required this.title, required this.body, required this.image});
}

List<OnBoardingModel> Model =[
  OnBoardingModel(title: AppStrings.onBoardTitle1, body: AppStrings.onBoardBody1, image: AppStrings.onBoardImage1),
  OnBoardingModel(title: AppStrings.onBoardTitle2, body: AppStrings.onBoardBody2, image: AppStrings.onBoardImage2),
  OnBoardingModel(title: AppStrings.onBoardTitle3, body: AppStrings.onBoardBody3, image: AppStrings.onBoardImage3),
  OnBoardingModel(title: AppStrings.onBoardTitle4, body: AppStrings.onBoardBody4, image: AppStrings.onBoardImage4),
];