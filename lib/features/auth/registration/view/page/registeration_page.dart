import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/core/utlis/context_extension.dart';
import 'package:sec3/features/auth/registration/controller/cubit/registeration_cubit.dart';
import 'package:sec3/features/auth/registration/view/components/bottom_widget.dart';
import 'package:sec3/features/auth/registration/view/components/required_data_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key,});

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegisterationCubit>(
        create: (context) => RegisterationCubit(),
        child: BlocBuilder<RegisterationCubit, RegisterationState>(
          builder: (context, state) {
          final  RegisterationCubit controller =
                        context.read<RegisterationCubit>();
            return Scaffold(
                appBar: AppBar(),
                body: RequiredDataWidget(controller: controller,),
                bottomNavigationBar: SizedBox(
                  child:  BottomNavigationWidget(controller: controller,),
                  height: context.height/4,
                ));
          },
        ),
      ),
    );
  }
}
