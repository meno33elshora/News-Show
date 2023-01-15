import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_show/src/view/pages/webView.dart';

import '../../controller/Bloc/cubit.dart';
import '../../controller/Bloc/state.dart';
import '../utils/color_manager.dart';
import '../widgets/card_custom.dart';

class Healthy extends StatelessWidget {
  const Healthy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instance = NewsCubit.get(context);

    return BlocConsumer<NewsCubit , NewsStates>(
        builder: (context, state) => state is NewsHealthyGetLoading ? Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              // color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child:  const SpinKitFadingCircle(
              color: ColorManager.brownDark,
              size: 50.0,
              // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
            ),
          ),
        ) :ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return AnimationLimiter(
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    child: ScaleAnimation(
                      // horizontalOffset: 100.0,
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 200),
                      child: customCard(
                          image: instance.healthy[index]['urlToImage'],
                          title: instance.healthy[index]['title'],
                          publishedAt: instance.healthy[index]['publishedAt'],
                          context: context,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context ) =>  WebViewNet(url: '${instance.healthy[index]['url']}',)));
                          }),
                    ),
                  ));
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: instance.healthy.length),
        listener: (context , state){
          // if(state is NewsBusinessGetLoading){
          //    const Center(child: CircularProgressIndicator(),);
          // }
        });
  }
}
