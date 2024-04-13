import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/features/auth/onboarding/controller/onbording_controller_cubit.dart';
import 'package:sec3/features/auth/onboarding/view/components/onboard_buttons.dart';
import 'package:sec3/features/auth/onboarding/view/components/onbording_body.dart';

class OnBordingPage extends StatelessWidget {
   OnBordingPage({super.key, required this.firstname, required this.lastname});
  final String firstname, lastname;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnbordingControllerCubit>(
        create: (context) => OnbordingControllerCubit(),
        child: BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
          builder: (context, state) {
            OnbordingControllerCubit controller =
                context.read<OnbordingControllerCubit>();
            return Scaffold(
              appBar: AppBar(
                title:  Text("$firstname $lastname"),
              ),
              body: OnbordingBody(
                controller: controller,
              ),
              bottomNavigationBar: OnbordingButtonWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
