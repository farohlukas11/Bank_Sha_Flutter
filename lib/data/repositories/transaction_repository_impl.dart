import 'dart:io';

import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/bank_model.dart';
import 'package:bank_sha/data/models/topup_form_model.dart';
import 'package:bank_sha/data/models/transfer_form_model.dart';
import 'package:bank_sha/data/source/datasources/transaction_remote_data_source.dart';
import 'package:bank_sha/domain/repositories/transaction_repository.dart';
import 'package:dartz/dartz.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource transactionRemoteDataSource;

  TransactionRepositoryImpl({required this.transactionRemoteDataSource});

  @override
  Future<Either<Failure, List<BankModel>>> getPaymentMethod(
      String token) async {
    try {
      final result = await transactionRemoteDataSource.getPaymentMethod(token);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> topUpMethod(
      TopUpFormModel topUpFormModel, String token) async {
    try {
      final result =
          await transactionRemoteDataSource.topUpMethod(topUpFormModel, token);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> transferMethod(
      TransferFormModel transferFormModel, String token) async {
    try {
      final result = await transactionRemoteDataSource.transferMethod(
          transferFormModel, token);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }
}
