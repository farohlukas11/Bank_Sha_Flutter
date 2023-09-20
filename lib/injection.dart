import 'package:bank_sha/data/repositories/preferences_repository_impl.dart';
import 'package:bank_sha/data/source/datasources/auth_remote_data_source.dart';
import 'package:bank_sha/data/repositories/auth_repository_impl.dart';
import 'package:bank_sha/data/source/preferences/preferences_source.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:bank_sha/domain/usecase/check_email.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/remove_token.dart';
import 'package:bank_sha/domain/usecase/set_token.dart';
import 'package:bank_sha/domain/usecase/signin_user.dart';
import 'package:bank_sha/domain/usecase/signup_user.dart';
import 'package:bank_sha/ui/signin/bloc/sign_in_bloc.dart';
import 'package:bank_sha/ui/signup/bloc/check_email_bloc.dart';
import 'package:bank_sha/ui/signupktp/bloc/signup_bloc.dart';
import 'package:bank_sha/ui/splash/bloc/get_token_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => CheckEmailBloc(locator()));
  locator.registerFactory(() => SignUpBloc(locator(), locator()));
  locator.registerFactory(() => SignInBloc(locator(), locator()));
  locator.registerFactory(() => GetTokenBloc(locator()));

  //use case
  locator.registerLazySingleton(() => CheckEmail(locator()));
  locator.registerLazySingleton(() => SignUpUser(locator()));
  locator.registerLazySingleton(() => SignInUser(locator()));
  locator.registerLazySingleton(() => GetToken(locator()));
  locator.registerLazySingleton(() => SetToken(locator()));
  locator.registerLazySingleton(() => RemoveToken(locator()));

  //repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));
  locator.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(preferencesSource: locator()));

  //data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PreferencesSource>(
      () => PreferencesSourceImpl(shared: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => const FlutterSecureStorage());
}
