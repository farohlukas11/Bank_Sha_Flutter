import 'dart:async';

import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/logout_user.dart';
import 'package:bank_sha/domain/usecase/remove_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(LogoutUser logoutUser, GetToken getToken, RemoveToken removeToken)
      : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      if (event is OnLogOutEvent) {
        emit(LogoutLoading());

        var token = await getToken.execute();
        token.fold(
          (error) {
            if (error is LocalFailure) {
              emit(LogoutError());
            }
          },
          (dataToken) async {
            _onLogoutEvent(
              dataToken,
              logoutUser,
              removeToken,
            );
          },
        );
      }
    });
  }

  FutureOr<void> _onLogoutEvent(
    String? token,
    LogoutUser logoutUser,
    RemoveToken removeToken,
  ) async {
    var result = await logoutUser.execute(token!);
    result.fold(
      (l) => emit(LogoutError()),
      (r) async {
        await removeToken.execute();
        emit(LogoutSuccess(r));
      },
    );
  }
}
