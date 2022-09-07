import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeScreenIndexState(screenIndex: 0)) {
    on<ChangeHomeScreenIndex>(_onChangeScreen);
  }
}

//

FutureOr<void> _onChangeScreen(
  ChangeHomeScreenIndex event,
  Emitter<HomeState> emit,
) async {
  emit(HomeScreenIndexState(screenIndex: event.screenIndex));
}
