import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';

class SignUpUser {
  final AuthRepository repository;

  SignUpUser(this.repository);

  Future<Either<Failure, UserModel>> execute(SignUpFormModel model) {
    return repository.signUp(model);
  }
}
