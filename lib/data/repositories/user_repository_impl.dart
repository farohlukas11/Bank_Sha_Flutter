import 'dart:io';

import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/data/source/datasources/user_data_source.dart';
import 'package:bank_sha/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getUser(String token) async {
    try {
      final result = await userRemoteDataSource.getUser(token);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserModel?>>> getUserByUsername(
    String token,
    String username,
  ) async {
    try {
      final result =
          await userRemoteDataSource.getUserByUsername(token, username);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }
}
