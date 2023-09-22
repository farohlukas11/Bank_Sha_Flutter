part of 'remove_token_bloc.dart';

abstract class RemoveTokenEvent extends Equatable {
  const RemoveTokenEvent();
}

class OnRemoveTokenEvent extends RemoveTokenEvent {
  @override
  List<Object?> get props => [];
}
