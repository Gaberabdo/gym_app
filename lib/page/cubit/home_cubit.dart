import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/model/exercise_model.dart';
import 'package:gym_app/model/user_model.dart';
import 'package:gym_app/page/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
List<String> title= [
  'Home Page',
  'Bmi Con'
];

  UserModel? userInfo;



  List<StretchesModel> stretchesModel=[];
  void getStretches() {
    emit(GetStretchesLoadingHomeState());
    FirebaseFirestore.instance
        .collection('stretches')
        .get()
        .then((value) {
      for (var element in value.docs) {
        stretchesModel.add(StretchesModel.fromJson(element.data()));
        print(value.docs.first.toString());
      }
      emit(GetStretchesSuccessHomeState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetStretchesErrorHomeState());

    });
  }


  List<StretchesModel> levelModel=[];
  void getLevel() {
    emit(GetLevelLoadingHomeState());
    FirebaseFirestore.instance
        .collection('level')
        .get()
        .then((value) {
      for (var element in value.docs) {
        levelModel.add(StretchesModel.fromJson(element.data()));
        print(value.docs.first.toString());
      }
      emit(GetLevelSuccessHomeState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetLevelErrorHomeState());

    });
  }


  void loginMethod({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SuccessLoginState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorLoginState(onError));
    });
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) {})
        .catchError((onError) {
      emit(ErrorRegisterState());
      print(onError.toString());
    });
  }




  bool isPassword = true;
  IconData suffix = Icons.visibility;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangePasswordVisibilityState());
  }
}
