import 'package:bank_sha/data/models/transfer_form_model.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repositories/transaction_repository.dart';

class TransferMethod {
  final TransactionRepository repository;

  TransferMethod(this.repository);

  Future<Either<Failure, String>> execute(
      TransferFormModel transferFormModel, String token) {
    return repository.transferMethod(transferFormModel, token);
  }
}
