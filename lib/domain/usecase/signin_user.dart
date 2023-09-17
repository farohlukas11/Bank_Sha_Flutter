import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/signin_form_model.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUser {
  final AuthRepository repository;

  SignInUser(this.repository);

  Future<Either<Failure, UserModel>> execute(SignInFormModel model) {
    return repository.signIn(model);
  }
}
