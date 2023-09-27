part of 'transfer_histories_bloc.dart';

abstract class TransferHistoriesState extends Equatable {
  const TransferHistoriesState();
}

class TransferHistoriesInitial extends TransferHistoriesState {
  @override
  List<Object> get props => [];
}

class TransferHistoriesHasEmpty extends TransferHistoriesState {
  @override
  List<Object> get props => [];
}

class TransferHistoriesHasData extends TransferHistoriesState {
  final List<UserModel> listModel;

  TransferHistoriesHasData(this.listModel);

  @override
  List<Object> get props => [listModel];
}

class TransferHistoriesError extends TransferHistoriesState {
  final String message;

  TransferHistoriesError(this.message);

  @override
  List<Object> get props => [message];
}
