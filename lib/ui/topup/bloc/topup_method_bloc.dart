import 'dart:async';

import 'package:bank_sha/data/models/topup_form_model.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/topup_method.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topup_method_event.dart';

part 'topup_method_state.dart';

class TopupMethodBloc extends Bloc<TopupMethodEvent, TopupMethodState> {
  TopupMethodBloc(GetToken getToken, TopUpMethod topUpMethod)
      : super(TopupMethodInitial()) {
    on<TopupMethodEvent>((event, emit) async {
      if (event is OnTopUpMethodEvent) {
        emit(TopupMethodLoading());

        var token = await getToken.execute();

        token.fold(
          (l) => emit(TopupMethodError()),
          (tokenData) => _onTopUpMethodEvent(
            topUpMethod,
            tokenData,
            event.model,
          ),
        );
      }

      if (event is OnSetTopUpFormModelEvent) {
        emit(TopupMethodGetData(event.model));
      }
    });
  }

  FutureOr<void> _onTopUpMethodEvent(
    TopUpMethod topUpMethod,
    String? token,
    TopUpFormModel model,
  ) async {
    if (token != null) {
      var result = await topUpMethod.execute(model, token);

      result.fold(
        (l) => emit(TopupMethodError()),
        (paymentUrl) => emit(TopupMethodHasData(paymentUrl)),
      );
    } else {
      emit(TopupMethodError());
    }
  }
}
