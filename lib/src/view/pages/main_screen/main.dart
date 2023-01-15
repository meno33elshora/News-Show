import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_show/src/controller/Bloc/cubit.dart';
import 'package:news_show/src/controller/Bloc/state.dart';
import 'package:news_show/src/view/pages/search.dart';
import 'package:news_show/src/view/utils/color_manager.dart';
import 'package:news_show/src/view/utils/size_manager.dart';

import '../setting.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    var instance = NewsCubit.get(context);

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state)=> Scaffold(
        appBar: AppBar(
          title: const Text("Media"),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                instance.allWidth = ! instance.allWidth;
              });
            }, icon:  Icon( instance.allWidth ? Icons.change_circle : Icons.change_circle_outlined ,
            color: instance.allWidth ? ColorManager.brownDark : ColorManager.grey  ,
            )),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchScreen()));
            }, icon:  const Icon(CupertinoIcons.search_circle_fill)),
          ],
        ),
        body: Row(
          children: [
            instance.allWidth== false ?  Expanded(
              child: AnimationLimiter(
                  child: AnimationConfiguration.staggeredList(
                    position: 1,
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 200),
                    child: SlideAnimation(
                      horizontalOffset: -100.0,
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.all(AppMargin.m8),
                          height: MediaQuery.of(context).size.height / 0.7,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorManager.blueDark,
                            borderRadius: BorderRadius.circular(AppSize.z10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: instance.icon.map(
                                  (e) {
                                return Container(
                                  height: MediaQuery.of(context).size.height / 10,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: AppMargin.m8,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        instance.select(instance.icon.indexOf(e));
                                        instance.pageController.jumpToPage(instance.icon.indexOf(e));
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: instance.selected[instance.icon.indexOf(e)]
                                              ? ColorManager.brownDark
                                              : Colors.transparent,
                                          child: Icon(
                                            e,
                                            color: instance.selected[instance.icon.indexOf(e)]
                                                ? ColorManager.grey
                                                : ColorManager.grey,
                                          ),
                                        ),
                                        const Spacer(),
                                        instance.selected[instance.icon.indexOf(e)]
                                            ? Container(
                                          width: 3,
                                          height: 40,
                                          color: ColorManager.brownDark,
                                        )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ),
                  )),
            ) : Container(),
            Expanded(
                flex: instance.allWidth == false ?  5 : 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: instance.pageController,
                          children: instance.screen,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
