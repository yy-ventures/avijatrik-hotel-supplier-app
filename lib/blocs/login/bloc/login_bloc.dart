import 'package:avijatrik_hotel_supplier_app/blocs/login/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authService}) : super(LoginPhoneNumberInvalid()) {
    on<LoginButtonPressed>(_onPressedLoginButton);
    on<CheckIsValidPhoneNumber>(_checkIsValidPhoneNumber);
  }

  final AuthService authService;

  Future<void> _checkIsValidPhoneNumber(
    CheckIsValidPhoneNumber event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginPhoneNumberValid());
    if (Validators.isValidPhoneNumber(event.phoneNumber)) {
      emit(LoginPhoneNumberValid());
    } else {
      emit(LoginPhoneNumberInvalid());
    }
  }

  Future<void> _onPressedLoginButton(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final response = await authService.sendOtp(event.phoneNumber);
    if (response.error == null) {
      emit(
        LoginSuccess(),
      );
    } else {
      emit(
        LoginError(
          errors: response.error!.messages ?? {},
        ),
      );
    }
  }
}
