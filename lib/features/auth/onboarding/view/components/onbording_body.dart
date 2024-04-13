import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/features/auth/onboarding/controller/onbording_controller_cubit.dart';

class OnbordingBody extends StatelessWidget {
  OnbordingBody({super.key, required this.controller});
  OnbordingControllerCubit controller;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Welcome in our app"),
        Expanded(
          child: BlocProvider<OnbordingControllerCubit>.value(
            value:OnbordingControllerCubit(),
            child:
                BlocBuilder<OnbordingControllerCubit, OnbordingControllerState>(
              builder: (context, state) {
                OnbordingControllerCubit controller =
                    context.read<OnbordingControllerCubit>();

                return Container(
                  height: 500,
                  child: PageView(
                    controller: controller.pageController,
                   children: List.generate(controller.data.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(controller.data[index].image),
                        Text(
                          controller.data[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: controller.data[index].color,
                          ),
                        ),
                        Text(
                          controller.data[index].subtitle,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                  ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


