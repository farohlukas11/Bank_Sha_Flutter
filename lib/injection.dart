import 'package:bank_sha/data/repositories/preferences_repository_impl.dart';
import 'package:bank_sha/data/repositories/transaction_repository_impl.dart';
import 'package:bank_sha/data/repositories/user_repository_impl.dart';
import 'package:bank_sha/data/source/datasources/auth_remote_data_source.dart';
import 'package:bank_sha/data/repositories/auth_repository_impl.dart';
import 'package:bank_sha/data/source/datasources/transaction_remote_data_source.dart';
import 'package:bank_sha/data/source/datasources/user_data_source.dart';
import 'package:bank_sha/data/source/preferences/preferences_source.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:bank_sha/domain/repositories/transaction_repository.dart';
import 'package:bank_sha/domain/repositories/user_repository.dart';
import 'package:bank_sha/domain/usecase/check_email.dart';
import 'package:bank_sha/domain/usecase/get_payment_method.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/get_transfer_histories.dart';
import 'package:bank_sha/domain/usecase/get_user.dart';
import 'package:bank_sha/domain/usecase/get_user_by_id.dart';
import 'package:bank_sha/domain/usecase/logout_user.dart';
import 'package:bank_sha/domain/usecase/remove_token.dart';
import 'package:bank_sha/domain/usecase/set_token.dart';
import 'package:bank_sha/domain/usecase/signin_user.dart';
import 'package:bank_sha/domain/usecase/signup_user.dart';
import 'package:bank_sha/domain/usecase/topup_method.dart';
import 'package:bank_sha/domain/usecase/transfer_method.dart';
import 'package:bank_sha/ui/home/bloc/get_user_bloc.dart';
import 'package:bank_sha/ui/home/bloc/remove_token_bloc.dart';
import 'package:bank_sha/ui/profile/bloc/logout_bloc.dart';
import 'package:bank_sha/ui/signin/bloc/sign_in_bloc.dart';
import 'package:bank_sha/ui/signup/bloc/check_email_bloc.dart';
import 'package:bank_sha/ui/signup/bloc/signup_bloc.dart';
import 'package:bank_sha/ui/splash/bloc/get_token_bloc.dart';
import 'package:bank_sha/ui/topup/bloc/payment_method_bloc.dart';
import 'package:bank_sha/ui/topup/bloc/topup_method_bloc.dart';
import 'package:bank_sha/ui/transfer/bloc/search_user_bloc.dart';
import 'package:bank_sha/ui/transfer/bloc/text_field_bloc.dart';
import 'package:bank_sha/ui/transfer/bloc/transfer_histories_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => CheckEmailBloc(locator()));
  locator.registerFactory(() => SignUpBloc(locator(), locator()));
  locator.registerFactory(() => SignInBloc(locator(), locator()));
  locator.registerFactory(() => GetTokenBloc(locator(), locator()));
  locator.registerFactory(() => LogoutBloc(locator(), locator(), locator()));
  locator.registerFactory(() => GetUserBloc(locator(), locator()));
  locator.registerFactory(() => SearchUserBloc(locator(), locator()));
  locator.registerFactory(() => TextFieldBloc());
  locator.registerFactory(() => RemoveTokenBloc(locator()));
  locator.registerFactory(() => PaymentMethodBloc(locator(), locator()));
  locator.registerFactory(() => TopupMethodBloc(locator(), locator()));
  locator.registerFactory(() => TransferHistoriesBloc(locator(), locator()));

  //use case
  locator.registerLazySingleton(() => CheckEmail(locator()));
  locator.registerLazySingleton(() => SignUpUser(locator()));
  locator.registerLazySingleton(() => SignInUser(locator()));
  locator.registerLazySingleton(() => GetToken(locator()));
  locator.registerLazySingleton(() => SetToken(locator()));
  locator.registerLazySingleton(() => RemoveToken(locator()));
  locator.registerLazySingleton(() => LogoutUser(locator()));
  locator.registerLazySingleton(() => GetUser(locator()));
  locator.registerLazySingleton(() => GetUserById(locator()));
  locator.registerLazySingleton(() => GetPaymentMethod(locator()));
  locator.registerLazySingleton(() => TopUpMethod(locator()));
  locator.registerLazySingleton(() => GetTransferHistories(locator()));
  locator.registerLazySingleton(() => TransferMethod(locator()));

  //repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));
  locator.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(preferencesSource: locator()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: locator()));
  locator.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(transactionRemoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PreferencesSource>(
      () => PreferencesSourceImpl(shared: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TransactionRemoteDataSource>(
      () => TransactionRemoteDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => const FlutterSecureStorage());
}
