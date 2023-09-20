import 'dart:async';

import 'package:bank_sha/data/models/signin_form_model.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/usecase/set_token.dart';
import 'package:bank_sha/domain/usecase/signin_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInUser signInUser, SetToken setToken)
      : super(SignInInitial()) {
    on<SignInEvent>(
      (event, emit) async {
        if (event is OnSignInEvent) {
          emit(SignInLoading());

          var result = await signInUser.execute(event.model);

          result.fold(
            (failure) => emit(SignInError(failure.message)),
            (data) {
              if (data.token != null) {
                setToken.execute(data.token!);
                emit(SignInHasData(data));
              }
            },
          );
        }
      },
    );
  }
}
