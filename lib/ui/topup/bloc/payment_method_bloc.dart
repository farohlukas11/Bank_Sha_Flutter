import 'dart:async';

import 'package:bank_sha/domain/usecase/get_payment_method.dart';
import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/bank_model.dart';

part 'payment_method_event.dart';

part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc(GetPaymentMethod getPaymentMethod, GetToken getToken)
      : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is OnPaymentMethodEvent) {
        emit(PaymentMethodLoading());

        var token = await getToken.execute();

        token.fold((l) => null, (dataToken) {
          _onGetPaymentMethod(getPaymentMethod, dataToken!);
        });
      }
    });
  }

  FutureOr<void> _onGetPaymentMethod(
      GetPaymentMethod getPaymentMethod, String token) async {
    var result = await getPaymentMethod.execute(token);

    result.fold(
      (l) => emit(PaymentMethodError()),
      (listData) => emit(PaymentMethodHasData(listData)),
    );
  }
}
