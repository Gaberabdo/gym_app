import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

class WorkoutPlanModel {
  final String image;
  final String title;

  WorkoutPlanModel({
    required this.title,
    required this.image,
  });
}

class WorkoutPlan extends StatelessWidget {
  WorkoutPlan({Key? key}) : super(key: key);
  List<WorkoutPlanModel> plans = [
    WorkoutPlanModel(
      image:
          'https://img.freepik.com/free-photo/portrait-young-afro-american-sports-man-standing-back-showing-musculs_171337-9236.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.1.798062041.1678310296&semt=ais',
      title: 'General Training',
    ),
    WorkoutPlanModel(
      image:
          'https://img.freepik.com/premium-photo/bodybuilder-showing-his-muscles_136403-5543.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.1.798062041.1678310296&semt=ais',
      title: 'Pro split',
    ),
    WorkoutPlanModel(
      image:
          'https://img.freepik.com/free-photo/bodybuilder-posing-studio-grey-background_613910-458.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.1.798062041.1678310296&semt=ais',
      title: 'Push-Pull-Legs',
    ),
    WorkoutPlanModel(
      image:
          'https://img.freepik.com/premium-photo/increasing-muscle-mass-through-exercise-muscle-man-back-view-black-background-strong-sportsman-raising-arms-with-triceps-biceps-muscles-fit-bodybuilder-showing-muscle-power_474717-54545.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.2.798062041.1678310296&semt=ais',
      title: 'Upper-lower',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TimelineTheme(
          data: TimelineThemeData(
              color: Colors.greenAccent,
              connectorTheme: ConnectorThemeData(
                color: const Color.fromRGBO(0, 169, 191, 1).withOpacity(.7),
              )),
          child: Timeline.tileBuilder(
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildPlan(plans[index])),
              itemCount: plans.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPlan(WorkoutPlanModel workoutPlanModel) => InkWell(
        onTap: () {

        },
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 5  horizontally
                  2.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(workoutPlanModel.image),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${workoutPlanModel.title}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
}
