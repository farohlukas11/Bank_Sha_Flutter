import 'package:bank_sha/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/bank_model.dart';
import '../../data/models/topup_form_model.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<BankModel>>> getPaymentMethod(String token);

  Future<Either<Failure, String>> topUpMethod(
      TopUpFormModel topUpFormModel, String token);
}
