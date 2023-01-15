import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_show/src/controller/Bloc/cubit.dart';
import 'package:news_show/src/controller/Bloc/state.dart';
import 'package:news_show/src/controller/network/local.dart';
import 'package:news_show/src/controller/network/remote.dart';
import 'package:news_show/src/controller/services/blocObserver.dart';
import 'package:news_show/src/controller/theme/theme.dart';
import 'package:news_show/src/view/pages/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.CacheInit();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getTechnology()..getHealthy()..getScience()..getSports()),
      ],
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state ){},
        builder: (context , state ){
          return MaterialApp(
            title: 'News Show',
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(),
            home: const Splash(),
          );
        },
      ),
    );
  }
}

