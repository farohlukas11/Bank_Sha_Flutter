import 'dart:async';

import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:bank_sha/domain/usecase/check_email.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_email_event.dart';

part 'check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  CheckEmailBloc(CheckEmail checkEmail) : super(CheckEmailInitial()) {
    on<CheckEmailEvent>(
      (event, emit) async {
        if (event is OnCheckEmailEvent) {
          emit(CheckEmailLoading());

          var result = await checkEmail.execute(event.model);

          result.fold(
            (failure) => emit(
              CheckEmailError(failure.message),
            ),
            (data) => emit(
              CheckEmailHasData(data),
            ),
          );
        }
      },
    );
  }
}
