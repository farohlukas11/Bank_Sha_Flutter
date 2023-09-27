part of 'transfer_histories_bloc.dart';

abstract class TransferHistoriesEvent extends Equatable {
  const TransferHistoriesEvent();
}

class OnTransferHistoriesEvent extends TransferHistoriesEvent {
  @override
  List<Object?> get props => [];
}
