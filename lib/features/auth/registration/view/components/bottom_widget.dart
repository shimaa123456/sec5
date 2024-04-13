import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/core/utlis/context_extension.dart';
import 'package:sec3/features/auth/registration/controller/cubit/registeration_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key, required this.controller});
  late final RegisterationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegisterationCubit, RegisterationState>(
            builder: (context, state) {
          RegisterationCubit controller = context.read<RegisterationCubit>();

          return Column(
            children: [
              SizedBox(
                height: context.height / 20,
              ),
              FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () {
                    controller.onPressedConfirmButton(context);
                  },
                  
                  child: const Text("Confirm")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account ? "),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.orange,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        decorationThickness: 3,
                      ),
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text("have an account ? "),
              //     TextButton(onPressed: (){},
              //     child: Text("login"),
              //     style: ButtonStyle(
              //       padding: MaterialStatePropertyAll( EdgeInsets.all(3)),
              //     ),
              //     ),
              //   ],

              // ),

              //  TextButton(onPressed: (){
              //   ///navigate for verification page
              // }, child: Text("have an account")
              // ),
            ],
          );
        },
        ),
        );
  }
}
