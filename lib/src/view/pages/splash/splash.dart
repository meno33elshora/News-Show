import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_show/src/controller/network/local.dart';
import 'package:news_show/src/view/pages/onBoarding/onBoarding.dart';
import '../../utils/color_manager.dart';
import '../../utils/const.dart';
import '../main_screen/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>  {

  @override
  void initState() {
     boardingShown = CacheHelper.GetData(key: "isLast") ?? false;
    Timer(const Duration(seconds: 2), () {
      if(boardingShown ){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const MainScreen()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const OnBoardingView()), (route) => false);

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: ColorManager.blueDark,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: ColorManager.grey.withOpacity(1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset("assets/logo.png")),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            // color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SpinKitFadingCircle(
            color: ColorManager.brownDark,
            size: 50.0,
            // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
          ),
        ),
        ],
    ),
      ),);
  }
}
