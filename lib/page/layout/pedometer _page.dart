import 'package:flutter/material.dart.';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class PedometerScreen extends StatelessWidget {
  PedometerScreen({Key? key}) : super(key: key);
  final CountDownController controller = new CountDownController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        NeonCircularTimer(
          width: 200,
          duration: 60*20,
          isTimerTextShown: true,
          neumorphicEffect: false,
          innerFillColor: Colors.white,
          innerFillGradient: LinearGradient(colors: [
            Colors.greenAccent.shade200,
            Colors.blueAccent.shade400
          ]),
          neonGradient: LinearGradient(colors: [
            Colors.greenAccent.shade200,
            Colors.blueAccent.shade400
          ]),
          controller: controller,
        ),
        Spacer(),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    controller.resume();
                  }),
              IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    controller.pause();
                  }),
              IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: () {
                    controller.restart();
                  }),
            ]),
        Spacer(),

        ClipPath(
          clipper: ProsteBezierCurve(
            position: ClipPosition.top,
            list: [
              BezierCurveSection(
                start: Offset(MediaQuery.of(context).size.width/2, 70),
                top: Offset(MediaQuery.of(context).size.width/3 , 7),
                end: Offset(0, 70),
              ),
            ],
          ),
          child: Container(
            height: 300,
            width: double.maxFinite,
            color: Colors.black54,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          child: Row(
                            children: [
                              Text('Cal',style: TextStyle(fontSize: 25),),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.local_fire_department_outlined,color: Colors.redAccent,size: 40),
                            ],
                          ),
                          onPressed: () {
                          }),
                      TextButton(
                          child: Row(
                            children: [
                              Text('Speed',style: TextStyle(fontSize: 25),),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.speed,color: Colors.purple,size: 40),
                            ],
                          ),
                          onPressed: () {
                          }),
                      TextButton(
                          child: Row(
                            children: [
                              Text('Step',style: TextStyle(fontSize: 25),),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.directions_walk,color: Colors.indigo,size: 40),
                            ],
                          ),
                          onPressed: () {
                          }),


                    ]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('156',style: TextStyle(fontSize: 25,color: Colors.redAccent),),
                        Text('12 m/s',style: TextStyle(fontSize: 25,color: Colors.purple),),
                        Text('1470',style: TextStyle(fontSize: 25,color: Colors.indigo),),


                      ]),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
