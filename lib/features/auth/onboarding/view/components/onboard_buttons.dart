import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/features/auth/onboarding/controller/onbording_controller_cubit.dart';

class OnbordingButtonWidget extends StatelessWidget {
  OnbordingButtonWidget({super.key, required this.controller});
  OnbordingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnbordingControllerCubit>.value(
      value: OnbordingControllerCubit(),
      child: BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
        builder: (context, state) {
          OnbordingControllerCubit controller =
              context.read<OnbordingControllerCubit>();
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.onCallSkip(context);
                    },
                    child: const Text('Skip')),
                TextButton(
                    onPressed: controller.onChangeToNext,
                    child: const Text('next')),
              ],
            ),
          );
        },
      ),
    );
  }
}
