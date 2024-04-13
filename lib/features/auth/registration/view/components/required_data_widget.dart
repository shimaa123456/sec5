import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec3/core/utlis/context_extension.dart';
import 'package:sec3/core/utlis/validation.dart';
import 'package:sec3/features/auth/registration/controller/cubit/registeration_cubit.dart';
import 'package:sec3/features/auth/registration/view/components/text_name_formater.dart';

// ignore: must_be_immutable
class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});
  final RegisterationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegisterationCubit, RegisterationState>(
          builder: (context, state) {
            
            RegisterationCubit controller = context.read<RegisterationCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 3,
                ),
                //logo
                Row(
                  children: [
                    ClipRRect(
                      
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset('assets/images/client.png' , height: 50, width: 50,),
                      // Image.network(
                      //   "https://www.dfstudio.com/digital-image-size-and-resolution-what-do-you-need-to-know/",
                      //   height: 50,
                      //   width: 50,
                      // ),
                    ),
                    SizedBox(
                     // width: MediaQuery.of(context).size.width / 4 ,
                     width : context.width/4,
                    ),
                     const Text(
                      "Sign up in ABC",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            
                const Spacer(
                  flex: 1,
                ),
              
                //first name
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.firstNameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                    FilteringTextInputFormatter.deny(RegExp(r'[-]')),
                    
                  ],
                  decoration: decoration.copyWith(labelText: 'first name'),
                  //  validator: (String? input){
                  //  MyValidation().nameValidate(input??'');
                  // }
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                //age
                 TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [MyAgeTextFieldFormater()],
                 // validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(labelText: 'age'),
                  //  validator: (String? input){
                  //  MyValidation().nameValidate(input??'');
                  // }
                ),
                //lastname
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.lastNameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(labelText: 'last name'),
                  //  validator: (String? input){
                  //  MyValidation().nameValidate(input??'');
                  // }
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                //email
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.emailController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    labelText: 'email',
                    hintText: 'xxxx@gmail.com',
                    prefixIcon: const Icon(Icons.mail),
                    //  validator: (String? input){
                    //  MyValidation().nameValidate(input??'');
                    // }
                  ),
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                //password
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    labelText: 'password',
                    prefixIcon: const Icon(Icons.lock),
                    //  validator: (String? input){
                    //  MyValidation().nameValidate(input??'');
                    // }
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
      //   label: const Text("last Name"),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ));
}
