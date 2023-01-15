import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../model/onboarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel ? onBoardingModel;
  const OnBoardingWidget({Key? key
    , required this.onBoardingModel,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50.0,),
        Text("${onBoardingModel?.title}" , style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20.0,),
        Text("${onBoardingModel?.body}" , style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.center,),
        const SizedBox(height: 20.0,),
        SvgPicture.asset("${onBoardingModel?.image}" ,height: MediaQuery.of(context).size.height/3,width: MediaQuery.of(context).size.width /1,),
      ],
    );
  }
}
