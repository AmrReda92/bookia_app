import 'package:bookia_application/core/widget/custom_button.dart';
import 'package:bookia_application/core/widget/custom_text_form_field.dart';
import 'package:bookia_application/feature/auth/data/model/register_request_model.dart';
import 'package:bookia_application/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia_application/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_application/feature/auth/presentation/ui/otp_verification/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          spacing: 20.h,
          children: [
            CustomTextFormField(hintText: "UserName",
              controller: nameController,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Name is required";
                }
              },),
            CustomTextFormField(hintText: "email",
              controller: emailController,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Email is required";
                }
              },
            ),
            CustomTextFormField(hintText: "password", isPassword: true,
              controller: passwordController,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Password is required";
                }else if (v.length<8){
                  return "password should be 8 char";
                }
              },),
            CustomTextFormField(hintText: "confirm password", isPassword: true,
              controller: confirmPasswordController,
              validator: (v) {
                if (passwordController.text != v) {
                  return "Password is not match";
                }
              },
            ),
            SizedBox(height: 40.h,),
            BlocListener< AuthCubit , AuthState>(
              listener: (context,state) {
                if(state is RegisterLoadingState){
                  showDialog(barrierDismissible: true, context: context, builder: (context)=> Center(child: CircularProgressIndicator()) );
                }else if(state is RegisterSuccessState){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OtpScreen()), (e)=>true);
                }else if(state is RegisterErrorState){
                  Navigator.pop(context);
                  showDialog(context: context, builder: (context)=>AlertDialog(
                    content: Text(state.erorrMessage),
                  ));
                }
              },
              child: CustomButton(title: "Register", onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(RegisterRequestModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      passwordConfirmation: confirmPasswordController.text)
                  );
                }
              },),
            ),
          ],
        ));
  }
}
