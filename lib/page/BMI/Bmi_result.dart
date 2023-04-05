import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/logic/helper.dart';
import 'package:gym_app/page/layout/home_page.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

class BMIResultScreen extends StatelessWidget {
  BMIResultScreen(
      {Key? key,
      required this.result,
      required this.protein,
      required this.height,
      required this.type,
      required this.age,
      required this.cal})
      : super(key: key);
  double result;
  double protein;
  double cal;
  bool type;
  int age;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromRGBO(0, 169, 191, 1).withOpacity(.7),
        Colors.greenAccent,
      ])),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              navigatorTo(context, const HomeScreen());
            },
            icon: const Icon(IconlyBroken.arrowLeft2),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(IconlyBold.profile)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SquarePercentIndicator(
                          width: 100,
                          height: 100,
                          startAngle: StartAngle.bottomRight,
                          reverse: true,
                          borderRadius: 12,
                          shadowWidth: 1.5,
                          progressWidth: 5,
                          shadowColor: Colors.grey,
                          progressColor: Colors.cyan,
                          progress: result / 100,
                          child: Center(
                              child: Text(
                            result.round().toString() + '%',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),
                      Text('Hi! , This Your BMI Result',
                          style: GoogleFonts.eduNswActFoundation(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 25)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(protein.round().toString() + 'g',
                            style: TextStyle(fontSize: 22, color: Colors.cyan)),
                      ),
                      Text(' Your need for protein',
                          style: GoogleFonts.eduNswActFoundation(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 25)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cal.round().toString() + ' cal',
                            style: TextStyle(fontSize: 22, color: Colors.cyan)),
                      ),
                      Text(' Your calorie needs',
                          style: GoogleFonts.eduNswActFoundation(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 25)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 12,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                             CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              backgroundImage: NetworkImage(
                                  'https://cdn0.iconfinder.com/data/icons/shopping-3-11/48/109-512.png'),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black,
                            ),
                             CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              backgroundImage: NetworkImage(
                                  'https://th.bing.com/th/id/R.096db067201ace57ab82e8a89a987e2a?rik=A69Ig1E08EZElg&pid=ImgRaw&r=0'),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              backgroundImage: NetworkImage(
                                  'https://th.bing.com/th/id/R.7faeab46b15a0ffa47b17fecb37b0500?rik=eqffW7alqCV8kg&pid=ImgRaw&r=0'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 12,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              child: Text(
                                (type ? 'Male' : 'Female').toString(),
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              child: Text(age.toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(.5),
                              child: Text(height.round().toString() + 'cm',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
