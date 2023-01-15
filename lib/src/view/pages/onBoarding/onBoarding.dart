import 'package:flutter/material.dart';
import 'package:news_show/src/controller/Bloc/cubit.dart';
import 'package:news_show/src/controller/Bloc/state.dart';
import 'package:news_show/src/controller/network/local.dart';
import 'package:news_show/src/model/onboarding_model.dart';
import 'package:news_show/src/view/pages/main_screen/main.dart';
import '../../utils/color_manager.dart';
import '../../utils/font_manager.dart';
import '../../utils/size_manager.dart';
import 'onboarding_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  bool lastItem = false;
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              "on boarding".toUpperCase(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => OnBoardingWidget(
                    onBoardingModel: Model[index],
                  ),
                  controller: pageController,
                  itemCount: Model.length,
                  onPageChanged: (int index) {
                    if(index == Model.length-1){
                      setState(() {
                        lastItem = true;
                      });
                    }else{
                      setState(() {
                        lastItem = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(AppMargin.m8),
                height: AppSize.z45,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    if(lastItem == true){
                      CacheHelper.SaveData(key: "isLast", value: true).then((value) {
                       if(value == true){
                         print("boardingShown Saved successfully");
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
                       }else{

                       }
                      });
                    }else{
                      pageController.nextPage(duration: const Duration(microseconds: 300), curve: Curves.decelerate);
                    }
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    "Next".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: ColorManager.grey, fontSize: FontSize.s18),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(AppMargin.m8),
                height: AppSize.z45,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    pageController.previousPage(duration: const Duration(microseconds: 300), curve: Curves.decelerate);

                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                      const MaterialStatePropertyAll(ColorManager.brown)),
                  child: Text(
                    "Previous".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: ColorManager.grey, fontSize: FontSize.s18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
