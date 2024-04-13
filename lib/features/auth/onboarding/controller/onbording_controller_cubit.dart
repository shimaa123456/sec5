// import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sec3/features/auth/onboarding/model/onboarding_model.dart';
import 'package:sec3/features/auth/registration/view/page/registeration_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

part 'onbording_controller_state.dart';

class OnbordingControllerCubit extends Cubit<OnbordingControllerState> {
  OnbordingControllerCubit() : super(OnbordingControllerInitial());

  // List images = [
  //   'assets/images/client.png',
  //   'assets/images/client.png',
  //   'assets/images/client.png'
  // ];
  // List titles = [
  //   'First',
  //   'Second',
  //   'Third',
  // ];
  // List subtitles = [
  //   'First screen',
  //   'Second screen',
  //   'Third screen',
  // ];
  // List colors = [
  //    Colors.green,
  //    Colors.blue,
  //    Colors.red,
  // ];

 final PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(
        duration: const Duration(seconds: 2), curve: Curves.bounceIn);
  }

  void onCallSkip(BuildContext context) async{
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // await sharedPreferences.setBool('onbording', true);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegistrationPage(),
      ),
    );
  }

  List data = [
    OnboardingModel(
        image: 'assets/images/client.png',
        title: 'First',
        subtitle: 'First screen',
        color: Colors.green),
    OnboardingModel(
        image: 'assets/images/client.png',
        title: 'Second',
        subtitle: 'Second screen',
        color: Colors.blue),
    OnboardingModel(
        image: 'assets/images/client.png',
        title: 'Third',
        subtitle: 'Third screen',
        color: Colors.red),
  ];
}
