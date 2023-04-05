import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/exercise_model.dart';

Widget buildStretchesItem(StretchesModel model) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(model.image),
                fit: BoxFit.fill
            ),
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colors.black,
                width: .5
            )
        ),
        child:Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            model.name,
            style: GoogleFonts.eduNswActFoundation(fontSize: 22,color: Colors.black),
          ),
        ),
      ),
    ],
  ),
);


