import 'package:bank_sha/common/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, void>> saveToken(String token);

  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, void>> removeToken();
}
