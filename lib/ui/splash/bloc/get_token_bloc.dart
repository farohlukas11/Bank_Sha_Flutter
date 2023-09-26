import 'dart:async';

import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/get_user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_token_event.dart';

part 'get_token_state.dart';

class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {
  GetTokenBloc(GetToken getToken, GetUser getUser) : super(GetTokenInitial()) {
    on<GetTokenEvent>(
      (event, emit) async {
        if (event is OnGetTokenEvent) {
          await Future.delayed(
            const Duration(seconds: 2),
          );

          Either<Failure, String?> result = await getToken.execute();

          result.fold(
            (failure) => emit(GetTokenEmpty()),
            (data) async {
              _onGetTokenEvent(getUser, data);
            },
          );
        }
      },
    );
  }

  FutureOr<void> _onGetTokenEvent(GetUser getUser, String? token) async {
    if (token == null) {
      emit(GetTokenEmpty());
    } else {
      Either<Failure, UserModel> data = await getUser.execute(token);

      data.fold((error) {
        if (error is Failure401) {
          emit(GetTokenEmpty());
        } else {
          emit(GetTokenHasData());
        }
      }, (r) => emit(GetTokenHasData()));
    }
  }
}
