import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_show/src/controller/Bloc/cubit.dart';
import 'package:news_show/src/controller/Bloc/state.dart';
import 'package:news_show/src/view/pages/webView.dart';
import 'package:news_show/src/view/widgets/card_custom.dart';

import '../utils/color_manager.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // const SearchScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> forKey = GlobalKey();

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
      builder: (context , state) {
        var instance = NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text("Search"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0,right: 10, left: 10),
            child: Column(
              // mainAxisAlignment:  instance.search.isEmpty ? MainAxisAlignment.start : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: TextFormField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        print('it not correct input');
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        instance.getSearch(value);
                      });
                    },
                    cursorColor: ColorManager.blueDark,
                    cursorWidth: 1,
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon:
                      IconButton(
                        padding:  EdgeInsets.zero,
                        onPressed: (){
                        controller.clear();
                      },icon: const Icon(CupertinoIcons.clear_circled_solid,color: ColorManager.blueDark,),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: ColorManager.blueDark , width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: ColorManager.blueDark , width: 2)
                      ),
                    ),
                  ),),
                instance.search.isEmpty ?  SizedBox(height: MediaQuery.of(context).size.height/3) : const SizedBox(height: 10.0,),
                instance.search.isEmpty ?  Center(child:  Text("Search is Empty",style: Theme.of(context).textTheme.titleLarge,),) :
                Expanded(child: AnimationLimiter(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: instance.search.length,
                    itemBuilder: (context , index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          child: ScaleAnimation(
                            duration: const Duration(milliseconds: 750),
                            child: FadeInAnimation(
                              child: customCard(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context ) =>  WebViewNet(url: '${instance.search[index]['url']}',)));
                                },
                                title: instance.search[index]['title'],
                                image: instance.search[index]['urlToImage'],
                                publishedAt: instance.search[index]['publishedAt'],
                                context: context,
                              ),
                            ),
                          )
                      );
                   }, separatorBuilder: (BuildContext context, int index)=> const SizedBox(),
                  ),
                ),)
              ],
            ),
          ),
        );
      }

    );
  }
}
