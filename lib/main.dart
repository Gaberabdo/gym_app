import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/logic/bloc_observer.dart';
import 'package:gym_app/logic/shared_preferences.dart';
import 'package:gym_app/page/cubit/home_cubit.dart';
import 'package:gym_app/page/cubit/home_state.dart';
import 'package:gym_app/page/layout/home_page.dart';
import 'package:gym_app/page/layout/onBoarding.dart';
import 'package:gym_app/page/user/login_page.dart';
import 'package:gym_app/page/user/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget? widget;

  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
    widget = HomeScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget!,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.startWidget});
  Widget startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getStretches()..getLevel(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            // theme: buildThemeData(),
            theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.grey,
              scaffoldBackgroundColor: Colors.black.withOpacity(.4),
              tabBarTheme: TabBarTheme(
                unselectedLabelColor: Colors.white30,
                labelColor: Colors.white70,
              ),
              appBarTheme: AppBarTheme(
                  foregroundColor: Colors.white.withOpacity(.5),
                  backgroundColor: Colors.black.withOpacity(.84)
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }


}
