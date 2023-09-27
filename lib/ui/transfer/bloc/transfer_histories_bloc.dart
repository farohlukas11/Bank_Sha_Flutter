import 'dart:async';

import 'package:bank_sha/domain/usecase/get_token.dart';
import 'package:bank_sha/domain/usecase/get_transfer_histories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

part 'transfer_histories_event.dart';

part 'transfer_histories_state.dart';

class TransferHistoriesBloc
    extends Bloc<TransferHistoriesEvent, TransferHistoriesState> {
  TransferHistoriesBloc(
      GetTransferHistories getTransferHistories, GetToken getToken)
      : super(TransferHistoriesInitial()) {
    on<TransferHistoriesEvent>((event, emit) async {
      if (event is OnTransferHistoriesEvent) {
        final token = await getToken.execute();

        token.fold(
          (error) => emit(TransferHistoriesError(error.message)),
          (dataToken) =>
              _onTransferHistoriesEvent(getTransferHistories, dataToken),
        );
      }
    });
  }

  FutureOr<void> _onTransferHistoriesEvent(
      GetTransferHistories getTransferHistories, String? token) async {
    if (token != null) {
      var result = await getTransferHistories.execute(token);

      result.fold(
        (error) => emit(TransferHistoriesError(error.message)),
        (list) {
          if (list.isNotEmpty) {
            emit(TransferHistoriesHasData(list as List<UserModel>));
          } else {
            emit(TransferHistoriesHasEmpty());
          }
        },
      );
    } else {
      emit(TransferHistoriesError('Tidak dapat mengambil data!'));
    }
  }
}
