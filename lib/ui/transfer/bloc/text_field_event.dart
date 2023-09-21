part of 'text_field_bloc.dart';

abstract class TextFieldEvent extends Equatable {
  const TextFieldEvent();
}

class OnValueChangedEvent extends TextFieldEvent {
  final String value;

  OnValueChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}
