import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, UserModel>> execute(String token) {
    return repository.getUser(token);
  }
}
