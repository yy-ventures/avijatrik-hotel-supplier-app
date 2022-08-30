import 'package:avijatrik_hotel_supplier_app/shared/otp/index.dart';
import 'package:bloc/bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerShow()) {
    on<TimerActive>(_onActiveTimer);
  }

  Future<void> _onActiveTimer(
    TimerActive event,
    Emitter<TimerState> emit,
  ) async {
    if (event.isActive) {
      emit(TimerShow());
    } else {
      emit(TimerHide());
    }
  }
}
