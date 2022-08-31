import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerActive extends TimerEvent {
  const TimerActive({required this.isActive});

  final bool isActive;

  @override
  List<Object?> get props => [isActive];
}
