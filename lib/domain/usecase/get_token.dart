import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart';

class GetToken {
  final PreferencesRepository repository;

  GetToken(this.repository);

  Future<Either<Failure, String?>> execute() {
    return repository.getToken();
  }
}
