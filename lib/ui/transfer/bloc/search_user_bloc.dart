import 'dart:async';

import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/get_user_by_id.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

part 'search_user_event.dart';

part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  SearchUserBloc(GetUserById getUserById, GetToken getToken)
      : super(SearchUserInitial()) {
    on<SearchUserEvent>((event, emit) async {
      if (event is OnSearchUserEvent) {
        emit(SearchUserLoading());

        var token = await getToken.execute();

        token.fold((l) => null, (dataToken) async {
          _onGetUserById(getUserById, dataToken!, event.username);
        });
      }
    });
  }

  FutureOr<void> _onGetUserById(
      GetUserById getUserById, String token, String username) async {
    var result = await getUserById.execute(token, username);

    result.fold(
      (failure) => emit(SearchUserError(failure.message)),
      (listData) {
        if (listData.isNotEmpty) {
          emit(SearchUserHasData(listData as List<UserModel>));
        } else {
          emit(SearchUserHasEmpty());
        }
      },
    );
  }
}
