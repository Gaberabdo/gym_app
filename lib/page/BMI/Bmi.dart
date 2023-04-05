import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../logic/helper.dart';
import 'Bmi_result.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double height = 120.0;

  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.cyan.withRed(150) : Colors.black12,
                      ),
                      child: Center(
                        child: Text('Male',
                            style: GoogleFonts.eduNswActFoundation(
                                color: Colors.black, fontSize: 28)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Card(
                    elevation: 12,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.black12 : Colors.cyan.withRed(150),
                      ),
                      child: Center(
                        child: Text('Female',
                            style: GoogleFonts.eduNswActFoundation(
                                color: Colors.black, fontSize: 28)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height',
                            style: GoogleFonts.eduNswActFoundation(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 28)),
                        const SizedBox(
                          height: 12,
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            width: 450,
                            child: SfSlider(

                              activeColor: Colors.white.withOpacity(.5),
                              min: 80.0,
                              max: 220.0,
                              value: height.round(),
                              interval: 20,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (value) {
                                setState(() {
                                  height = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.none,
                          elevation: 12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight',
                                    style: GoogleFonts.eduNswActFoundation(
                                        color: Colors.white.withOpacity(.5),
                                        fontSize: 28)),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  weight.toString(),
                                  style: GoogleFonts.eduNswActFoundation(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 70,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.white.withOpacity(.4),
                                      elevation: 10,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      heroTag: 'weight-',
                                      mini: true,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                    FloatingActionButton(

                                      backgroundColor: Colors.white.withOpacity(.4),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      heroTag: 'weight+',
                                      mini: true,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.none,
                          elevation: 12,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Age',
                                    style: GoogleFonts.eduNswActFoundation(
                                        color: Colors.white.withOpacity(.5),
                                        fontSize: 28)),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  age.toString(),
                                  style: GoogleFonts.eduNswActFoundation(
                                    color: Colors.white.withOpacity(.5),

                                    fontSize: 70,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.white.withOpacity(.4),
                                      elevation: 10,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      heroTag: 'weight-',
                                      mini: true,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                      ),
                                    ),
                                    FloatingActionButton(
                                      backgroundColor: Colors.white.withOpacity(.4),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      heroTag: 'weight+',
                                      mini: true,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 30,
            child: Container(
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                elevation: 40,
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  double cal = (10 * weight) + (6.25 * height) - (5 * age) + 5;
                  double pro = weight * 1.8;
                  print(cal.round());
                  navigatorTo(
                      context,
                      BMIResultScreen(
                        result: result,
                        protein: pro,
                        cal: cal,
                        height: height,
                        type: isMale,
                        age: age,
                      ));
                },
                child: Text('Let\'s Begin',
                    style: GoogleFonts.eduNswActFoundation(
                        color: Colors.white.withOpacity(.5),
                        fontSize: 28)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
