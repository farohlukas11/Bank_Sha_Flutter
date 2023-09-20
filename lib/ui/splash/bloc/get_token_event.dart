part of 'get_token_bloc.dart';

abstract class GetTokenEvent extends Equatable {
  const GetTokenEvent();
}

class OnGetTokenEvent extends GetTokenEvent {
  @override
  List<Object?> get props => [];
}
