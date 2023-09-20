import 'package:bank_sha/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/user_model.dart';

abstract class UserRepository{
  Future<Either<Failure, UserModel>> getUser(String token);

  Future<Either<Failure, List<UserModel>?>> getUserByUsername(String token, String username);
}