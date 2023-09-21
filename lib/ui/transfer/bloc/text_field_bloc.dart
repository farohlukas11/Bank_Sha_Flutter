import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_field_event.dart';

part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super(TextFieldState.initial()) {
    on<TextFieldEvent>((event, emit) {
      if (event is OnValueChangedEvent) {
        emit(TextFieldState(value: event.value));
      }
    });
  }
}
