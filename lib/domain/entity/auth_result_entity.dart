import 'package:e_commerce/domain/entity/UserEntity.dart';

class AuthResultEntity{
  UserEntity? userEntity ;
  String? token ;
  AuthResultEntity({this.userEntity,this.token});
}