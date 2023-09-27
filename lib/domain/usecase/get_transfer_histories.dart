import 'package:bank_sha/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../../data/models/user_model.dart';

class GetTransferHistories {
  final UserRepository repository;

  GetTransferHistories(this.repository);

  Future<Either<Failure, List<UserModel?>>> execute(String token) {
    return repository.getTransferHistories(token);
  }
}
