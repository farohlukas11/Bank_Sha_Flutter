import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart';

class SetToken {
  final PreferencesRepository repository;

  SetToken(this.repository);

  Future<Either<Failure, void>> execute(String token) {
    return repository.saveToken(token);
  }
}
