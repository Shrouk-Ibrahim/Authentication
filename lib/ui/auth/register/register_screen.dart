import 'package:e_commerce/components/custom_text_field.dart';
import 'package:e_commerce/domain/di.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
static const String routeName = 'Register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel  viewModel  = RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel , RegisterStates>(
      bloc: viewModel,
        listener: (context,state){
        if(state is RegisterLoadingState){
          DialogUtils.showMessage(context, state.loadingMessage??"Waiting..");

        }else if(state is RegisterErrorState){

          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!, title: 'Error',
          positiveActionName: 'OK'
          );

        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, 'Register Successfully', title: 'Success',
              positiveActionName: 'OK'
          );
        }

        },
    child:Scaffold (
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/Splash Screen.png',
                width: double.infinity, fit: BoxFit.fitWidth),
            Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3),
                    CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ' please enter username';
                          }
                          return null;
                        },
                        label: 'Full Name ',
                        textStyle: TextStyle(color: Colors.white), // Ensures input text is white
                        labelStyle: TextStyle(color: Colors.white), // Ensures label text is white
                        controller: viewModel.nameController),
                    CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ' please enter your phone number';
                          }


                        },
                        controller: viewModel.phoneNumberController,
                        label: 'Phone Number',
                        textStyle: TextStyle(color: Colors.white), // Ensures input text is white
                        labelStyle: TextStyle(color: Colors.white), // Ensures label text is white
                        keyBoardType: TextInputType.phone,
                        isPassword: false),
                    CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ' please enter email';
                          }
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        textStyle: TextStyle(color: Colors.white), // Ensures input text is white
                        labelStyle: TextStyle(color: Colors.white), // Ensures label text is white
                        controller: viewModel.emailController,
                        keyBoardType: TextInputType.emailAddress),
                    CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ' please enter password';
                          }
                          if (text.length < 6) {
                            return 'password should be at least 7 characters';
                          }
                          return null;
                        },
                        controller: viewModel.passwordController,
                        label: 'Password',
                        textStyle: TextStyle(color: Colors.white), // Ensures input text is white
                        labelStyle: TextStyle(color: Colors.white), // Ensures label text is white
                        keyBoardType: TextInputType.number,
                        isPassword: true),
                    CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return ' please enter confirmation password';
                          }
                          if (text != viewModel.passwordController.text) {
                            return "confirmation password doesn't match";
                          }
                          return null;
                        },
                        controller: viewModel.confirmationPasswordController,
                        label: 'Confirmation Password',
                        textStyle: TextStyle(color: Colors.white), // Ensures input text is white
                        labelStyle: TextStyle(color: Colors.white), // Ensures label text is white
                        keyBoardType: TextInputType.number,
                        isPassword: true),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.Register();

                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            )),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        'Already has an account',
                        style: TextStyle(color: Colors.white), // Correctly applied TextStyle
                      ),
                    ),

                  ],
                ))
          ],
        ),
      ),
    ) ,

    );

  }
}
