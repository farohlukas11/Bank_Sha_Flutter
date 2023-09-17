import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/signup_form_model.dart';

class CheckEmail {
  final AuthRepository repository;

  CheckEmail(this.repository);

  Future<Either<Failure, bool>> execute(SignUpFormModel model) {
    return repository.checkEmail(model);
  }
}
