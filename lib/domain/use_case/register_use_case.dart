import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/domain/failure.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});
  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email, String password, String rePassword,
      String phone) {
    return repositoryContract.register(name, email, password, rePassword, phone);
  }
}
