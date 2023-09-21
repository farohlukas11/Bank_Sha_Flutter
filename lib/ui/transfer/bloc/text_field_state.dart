part of 'text_field_bloc.dart';

class TextFieldState {
  final String value;

  TextFieldState({required this.value});

  factory TextFieldState.initial() {
    return TextFieldState(value: '');
  }
}
