import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/page/cubit/home_cubit.dart';

import '../../model/exercise_model.dart';

class CarouselModel {
  final String title;
  final String body;
  final String image;
  CarouselModel({required this.image, required this.body, required this.title});
}

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key}) : super(key: key);

  List<CarouselModel> model = [
    CarouselModel(
      image:
          'https://img.freepik.com/free-photo/athlete-runner-prepare-run-from-crouch-start_176420-16476.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.1.798062041.1678310296&semt=ais',
      body: 'Full Body',
      title: 'With cardio',
    ),
    CarouselModel(
      image:
          'https://img.freepik.com/free-photo/athletic-man-preparing-barbell-weight-training-gym-copy-space_637285-2504.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.1.798062041.1678310296&semt=ais',
      body: 'Power Lifting',
      title: '',
    ),
    CarouselModel(
      image:
          'https://img.freepik.com/free-photo/confident-sportswoman-stretching-studio_23-2147752845.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.2.798062041.1678310296&semt=ais',
      body: 'Stretches',
      title: '',
    ),
    CarouselModel(
      image:
          'https://img.freepik.com/free-photo/muscular-man-doing-weightlifting-fitness-center_1163-3551.jpg?size=626&ext=jpg&uid=R78903714&ga=GA1.2.798062041.1678310296&semt=ais',
      body: 'Body Building',
      title: 'Chose your Goals',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            FlutterCarousel(
              items: model.map((e) => buildCat(e)).toList(),
              options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  viewportFraction: .99,
                  showIndicator: false),
            ),
            SizedBox(
              height: 700,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildStretchesItem(HomeCubit.get(context).levelModel[index]),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: HomeCubit.get(context).levelModel.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCat(CarouselModel model) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                    model.image.toString(),
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadiusDirectional.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      model.body,
                      style: GoogleFonts.eduNswActFoundation(
                        fontSize: 35,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Let' '\'s start',
                    style: GoogleFonts.caveat(
                        fontSize: 35, color: Colors.amber.withOpacity(.7)),
                  ),
                  Text(
                    model.title,
                    style: GoogleFonts.caveat(
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  Widget buildStretchesItem(StretchesModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){},
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 200,
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
                    image: DecorationImage(
                        image: NetworkImage(model.image), fit: BoxFit.fill),
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: GoogleFonts.eduNswActFoundation(
                            fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        model.level,
                        style: GoogleFonts.eduNswActFoundation(
                            fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
