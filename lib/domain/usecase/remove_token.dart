import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveToken {
  final PreferencesRepository repository;

  RemoveToken(this.repository);

  Future<Either<Failure, void>> execute() {
    return repository.removeToken();
  }
}
