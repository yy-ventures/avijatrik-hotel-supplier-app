import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserProfileLoading()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
