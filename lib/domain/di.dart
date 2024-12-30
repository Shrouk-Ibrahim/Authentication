import 'package:e_commerce/data/model/api/api_manager.dart';
import 'package:e_commerce/data/repository/repository/auth_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase (){
  return RegisterUseCase(repositoryContract:injectAuthRepositoryContract() );
}
AuthRepositoryContract injectAuthRepositoryContract(){
return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}