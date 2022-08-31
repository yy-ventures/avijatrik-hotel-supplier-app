import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {}

class TimerShow extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerHide extends TimerState {
  @override
  List<Object?> get props => [];
}