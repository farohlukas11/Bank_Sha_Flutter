import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/bank_model.dart';
import 'package:bank_sha/domain/repositories/transaction_repository.dart';
import 'package:dartz/dartz.dart';

class GetPaymentMethod {
  final TransactionRepository repository;

  GetPaymentMethod(this.repository);

  Future<Either<Failure, List<BankModel>>> execute(String token) {
    return repository.getPaymentMethod(token);
  }
}
