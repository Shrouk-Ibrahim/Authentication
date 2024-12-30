
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/failure.dart';
import 'package:e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
return remoteDataSource.register(name, email, password, rePassword, phone);
  }

}