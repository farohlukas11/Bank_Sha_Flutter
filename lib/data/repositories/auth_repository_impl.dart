import 'dart:io';

import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/datasources/auth_remote_data_source.dart';
import 'package:bank_sha/data/models/signin_form_model.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> checkEmail(SignUpFormModel model) async {
    try {
      final result = await authRemoteDataSource.checkEmail(model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInFormModel model) async {
    try {
      final result = await authRemoteDataSource.signIn(model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(SignUpFormModel model) async {
    try {
      final result = await authRemoteDataSource.signUp(model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> logOut(String token) async {
    try {
      final result = await authRemoteDataSource.logOut(token);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }
}
