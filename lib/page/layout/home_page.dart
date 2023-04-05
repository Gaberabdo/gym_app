import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/logic/helper.dart';
import 'package:gym_app/model/exercise_model.dart';
import 'package:gym_app/page/BMI/Bmi.dart';
import 'package:gym_app/page/BMI/Bmi_result.dart';
import 'package:gym_app/page/layout/feeds_page.dart';
import 'package:gym_app/page/layout/pedometer%20_page.dart';
import 'package:gym_app/page/layout/workout_plan.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            // const Color.fromRGBO(0, 169, 191, 1).withOpacity(.7),
            // Colors.greenAccent,
                Color(0xff0d324d),
                Color(0xff7f5a83),
          ])),
          child: DefaultTabController(
            length: 4,
            animationDuration: const Duration(milliseconds: 400),
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                title: Text(
                  "Home Page",
                  style: GoogleFonts.cairo(fontSize: 22),
                ),
                actions: [
                  PopupMenuButton<int>(
                    elevation: 40,
                    shape:ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text('Feedback'),
                              Spacer(),
                              Icon(Icons.feedback_outlined)
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text('Profile'),
                              Spacer(),
                              Icon(IconlyLight.profile)
                            ],
                          ),
                        ),
                      ),
                    ],
                    icon: const Icon(
                      IconlyBold.setting,
                    ),
                    offset: const Offset(0, 40),
                  )
                ],
                elevation: 0,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabBar(
                        isScrollable: true,
                        tabs: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(
                              icon: Icon(
                                IconlyLight.home,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(
                              icon: Icon(
                                IconlyLight.scan,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(
                              icon: Icon(
                                Icons.paste_sharp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tab(
                              icon: Icon(
                                IconlyLight.shieldDone,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  FeedsScreen(),
                  const BMIScreen(),
                  WorkoutPlan(),
                  PedometerScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
