import 'dart:async';

import 'package:bank_sha/domain/usecase/remove_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remove_token_event.dart';

part 'remove_token_state.dart';

class RemoveTokenBloc extends Bloc<RemoveTokenEvent, RemoveTokenState> {
  RemoveTokenBloc(RemoveToken removeToken) : super(RemoveTokenInitial()) {
    on<RemoveTokenEvent>((event, emit) async {
      if (event is OnRemoveTokenEvent) {
        await removeToken.execute();
      }
    });
  }
}
