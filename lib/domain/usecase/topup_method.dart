import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/topup_form_model.dart';
import 'package:bank_sha/domain/repositories/transaction_repository.dart';
import 'package:dartz/dartz.dart';

class TopUpMethod {
  final TransactionRepository repository;

  TopUpMethod(this.repository);

  Future<Either<Failure, String>> execute(
      TopUpFormModel topUpFormModel, String token) {
    return repository.topUpMethod(topUpFormModel, token);
  }
}
