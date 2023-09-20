import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/usecase/set_token.dart';
import 'package:bank_sha/domain/usecase/signup_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/signup_form_model.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  SignUpBloc(SignUpUser signUpUser, SetToken setToken)
      : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is OnRegisterEvent) {
        emit(SignupLoading());

        var result = await signUpUser.execute(event.model);

        result.fold(
          (failure) => emit(
            SignupError(failure.message),
          ),
          (data) {
            if (data.token != null) {
              setToken.execute(data.token!);
              emit(
                SignupHasData(data),
              );
            }
          },
        );
      }
    });
  }
}
