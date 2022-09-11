import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(const BottomNavigationScreenChange(screenIndex: 0)) {
    on<ChangeScreen>(_onChangeScreen);
  }
}

Future<void> _onChangeScreen(
  ChangeScreen event,
  Emitter<BottomNavigationState> emit,
) async {
  emit(BottomNavigationScreenChange(screenIndex: event.screenIndex));
}
