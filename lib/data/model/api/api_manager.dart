import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/api/api_constants.dart';
import 'package:e_commerce/data/model/request/RegisterRequest.dart';
import 'package:e_commerce/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce/domain/failure.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance ;
  static ApiManager getInstance(){
    _instance??= ApiManager._() ;
    return _instance! ;
  }

  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
Future<Either<Failures,RegisterResponseDto>>register(String name, String email, String password, String rePassword, String phone)async {
  Uri url =Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile||
      connectivityResult == ConnectivityResult.wifi) {
    var registerBody = RegisterRequest(
        name: name,
        password: password,
        email: email,
        phone: phone,
        rePassword: rePassword
    );
    var response = await http.post(url,body: registerBody.toJson());
 var registerResponse =RegisterResponseDto.fromJson(jsonDecode(response.body));
 if(response.statusCode>=200&&response.statusCode<300){
   return right(registerResponse);
 }else{
   return left(ServerError(errorMessage: 'Error'));
 }

  }else{
return Left(NetworkError(errorMessage: 'Please check internet connection'));
  }
}
}