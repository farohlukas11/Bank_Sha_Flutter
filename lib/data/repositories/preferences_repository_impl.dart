import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/source/preferences/preferences_source.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesSource preferencesSource;

  PreferencesRepositoryImpl({required this.preferencesSource});

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final result = await preferencesSource.getToken();
      return Right(result);
    } on LocalException {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeToken() async {
    try {
      await preferencesSource.removeToken();
    } on LocalException {
      return Left(LocalFailure());
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await preferencesSource.saveToken(token);
    } on LocalException {
      return Left(LocalFailure());
    }
    return const Right(null);
  }
}
