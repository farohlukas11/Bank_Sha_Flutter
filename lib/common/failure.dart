import 'package:bank_sha/common/shared_values.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Server Failure'}) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure({String message = connectionErrorMessage}) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Unknown error occured');
}

class LocalFailure extends Failure {
  LocalFailure({String message = localErrorMessage}) : super(message);
}

class Failure401 extends Failure {
  Failure401() : super('');
}
