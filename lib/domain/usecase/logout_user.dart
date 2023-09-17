import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUser {
  final AuthRepository repository;

  LogoutUser(this.repository);

  Future<Either<Failure, String>> execute(String token) {
    return repository.logOut(token);
  }
}
