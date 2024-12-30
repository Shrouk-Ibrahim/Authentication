import 'package:e_commerce/domain/entity/auth_result_entity.dart';

import 'UserDto.dart';


class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity:user?.toUserEntity()
    );
  }

}