import 'package:bank_sha/common/shared_values.dart';
import 'package:bank_sha/data/datasources/auth_remote_data_source.dart';
import 'package:bank_sha/data/repositories/auth_repository_impl.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:bank_sha/domain/usecase/check_email.dart';
import 'package:bank_sha/domain/usecase/signin_user.dart';
import 'package:bank_sha/domain/usecase/signup_user.dart';
import 'package:bank_sha/ui/signup/bloc/check_email_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => CheckEmailBloc(locator()));

  //use case
  locator.registerLazySingleton(() => CheckEmail(locator()));
  locator.registerLazySingleton(() => SignUpUser(locator()));
  locator.registerLazySingleton(() => SignInUser(locator()));

  //repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}
