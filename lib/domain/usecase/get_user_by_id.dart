import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserById {
  final UserRepository repository;

  GetUserById(this.repository);

  Future<Either<Failure, List<UserModel?>>> execute(
    String token,
    String username,
  ) {
    return repository.getUserByUsername(token, username);
  }
}
