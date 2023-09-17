import 'package:bank_sha/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/signin_form_model.dart';
import '../../data/models/signup_form_model.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkEmail(SignUpFormModel model);

  Future<Either<Failure, UserModel>> signUp(SignUpFormModel model);

  Future<Either<Failure, UserModel>> signIn(SignInFormModel model);

  Future<Either<Failure, String>> logOut(String token);
}
