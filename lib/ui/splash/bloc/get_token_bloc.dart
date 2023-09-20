import 'dart:async';

import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_token_event.dart';

part 'get_token_state.dart';

class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {
  GetTokenBloc(GetToken getToken) : super(GetTokenInitial()) {
    on<GetTokenEvent>(
      (event, emit) async {
        if (event is OnGetTokenEvent) {
          await Future.delayed(
            const Duration(seconds: 2),
          );

          var result = await getToken.execute();

          result.fold(
            (failure) => null,
            (data) => emit(
              data != null ? GetTokenHasData() : GetTokenEmpty(),
            ),
          );
        }
      },
    );
  }
}
