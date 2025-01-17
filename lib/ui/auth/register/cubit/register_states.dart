import 'package:e_commerce/domain/entity/auth_result_entity.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{
  String? loadingMessage ;
  RegisterLoadingState({required this.loadingMessage});
}
class RegisterErrorState extends RegisterStates{
  String? errorMessage ;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{

AuthResultEntity resultEntity ;
RegisterSuccessState({required this.resultEntity});
}