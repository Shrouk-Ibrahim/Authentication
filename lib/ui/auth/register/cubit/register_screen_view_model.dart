import 'package:e_commerce/domain/use_case/register_use_case.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}) : super(RegisterInitialState());
  var nameController = TextEditingController(text: 'shrouk');

  var emailController = TextEditingController(text: 'shrouk@gmail.com');

  var passwordController = TextEditingController(text: '123456');

  var phoneNumberController = TextEditingController(text: '4245435');

  var confirmationPasswordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();
  void Register ()async{
if(formKey.currentState?.validate() == true){
  emit(RegisterLoadingState(loadingMessage: 'Loading ...'));
var either = await registerUseCase.invoke(nameController.text, emailController.text, passwordController.text, confirmationPasswordController.text, phoneNumberController.text);
either.fold((error){
  emit(RegisterErrorState(errorMessage: error.errorMessage));
},
        (response) {
emit(RegisterSuccessState(resultEntity: response));
        }
);
}
  }
}