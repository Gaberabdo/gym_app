import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/logic/helper.dart';
import 'package:gym_app/logic/shared_preferences.dart';
import 'package:gym_app/page/layout/home_page.dart';
import 'package:gym_app/page/user/login_page.dart';
import 'package:gym_app/page/user/register_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  final Color color;

  OnBoardingModel({
    required this.title,
    required this.image,
    required this.body,
    required this.color,
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final Duration initialDelay = const Duration(seconds: 1);

  var boardController = PageController();
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: 'assets/images/onboard_1.png',
      title: 'Supplements',
      body:
          'Workout plans designed to help you achieve your fitness goals-whether losing weight or building muscle',
      color: Colors.indigo.shade800,
    ),
    OnBoardingModel(
      image: 'assets/images/onboard_2.png',
      title: 'Supports Healthy Heart ',
      body:
          'Playing sports may help with your stretching ability. In fact, the heart benefits much from playing sports. The cardiovascular health can be improved by playing sports as well.',
      color: Colors.black.withBlue(50),
    ),
    OnBoardingModel(
      image: 'assets/images/onboard_3.png',
      title: 'Improve Blood Circulation',
      body:
          'Your blood circulation will be better when you play sports. This supports the proper circulation of essential nutrients all over the body.',
      color: Colors.black87,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          DelayedDisplay(
            delay: Duration(seconds: 4),
            child: TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'onBoarding', value: true)
                    .then((value) {
                  navigatorTo(context, HomeScreen());
                });
              },
              child: Text(
                'Skip   >',
                style:
                    GoogleFonts.fahkwang(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: boardController,
        itemBuilder: (context, index) => buildStack(boarding[index]),
        itemCount: boarding.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Stack buildStack(OnBoardingModel model) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  model.color.withOpacity(1), BlendMode.dstATop),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const SizedBox(
                height: 111,
              ),
              DelayedDisplay(
                slidingCurve: Curves.linear,
                delay: initialDelay,
                child: Text(
                  model.title,
                  style: GoogleFonts.eduNswActFoundation(
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 1),
                child: Text(
                  model.body,
                  maxLines: 3,
                  style: GoogleFonts.robotoMono(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 2),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: boardController,
                      count: 3,
                      effect: const JumpingDotEffect(
                        offset: 6,
                        dotColor: Colors.white,
                        activeDotColor: Colors.indigo,
                        dotHeight: 6,
                        dotWidth: 6,
                        spacing: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: initialDelay.inSeconds + 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: MaterialButton(
                        onPressed: () {
                          navigatorTo(context, LoginScreen());
                        },
                        minWidth: 1,
                        child: Text(
                          'Log In',
                          style: GoogleFonts.cairo(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: MaterialButton(
                        onPressed: () {
                          navigatorTo(context, RegisterScreen());
                        },
                        minWidth: 1,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.cairo(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
