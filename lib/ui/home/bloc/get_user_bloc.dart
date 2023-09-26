import 'dart:async';

import 'package:bank_sha/common/failure.dart';
import 'package:bank_sha/data/models/user_model.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/get_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_user_event.dart';

part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc(GetToken getToken, GetUser getUser) : super(GetUserInitial()) {
    on<GetUserEvent>((event, emit) async {
      if (event is OnGetUserEvent) {
        var token = await getToken.execute();

        token.fold((l) => null, (dataToken) async {
          _onGetUser(dataToken!, getUser);
        });
      }
    });
  }

  FutureOr<void> _onGetUser(String token, GetUser getUser) async {
    var result = await getUser.execute(token);

    result.fold(
      (error) => emit(GetUserError()),
      (model) => emit(GetUserHasData(model)),
    );
  }
}
