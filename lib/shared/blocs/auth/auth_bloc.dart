import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/index.dart';
import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.userService})
      : super(const AppInitial(status: AuthenticationStatus.unAuthenticated)) {
    on<AppStarted>(_onAppStart);
    on<ChangeAuthStatus>(_changeAuthStatus);
  }

  final UserService userService;

  Future<void> _changeAuthStatus(
    ChangeAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    await _updateState(emit, event.authenticationStatus);
  }

  Future<void> _onAppStart(
    AppStarted event,
    Emitter<AuthState> emit,
  ) async {
    final isInternetConnected = await AppHelper.hasInternetConnected();

    if (isInternetConnected) {
      final isAuthenticated = AuthHelper.isAuthenticated();

      if (isAuthenticated) {
        final response = await userService.getProfile();

        if (response.error == null && response.payload != null) {
          DbHelper.saveData(
            Tables.userInfo,
            AppKeys.userInfo,
            response.payload,
          );

          final user = User.fromJson(jsonDecode(response.payload));
          emit(
            Authenticated(
              status: AuthenticationStatus.authenticated,
              hasPreferences: user.preferences.isNotEmpty,
            ),
          );
        } else {
          emit(
            const UnAuthenticated(
              status: AuthenticationStatus.unAuthenticated,
            ),
          );
        }
      } else {
        await Future.delayed(const Duration(seconds: 2));
        emit(
          const UnAuthenticated(
            status: AuthenticationStatus.unAuthenticated,
          ),
        );
      }
    } else {
      emit(
        const AuthenticationFailedDueToInternetConnection(
          status: AuthenticationStatus.unAuthenticated,
        ),
      );
    }
  }

  Future<void> _updateState(
    Emitter<AuthState> emit,
    AuthenticationStatus status,
  ) async {
    switch (status) {
      case AuthenticationStatus.authenticated:
        emit(
          const Authenticated(
            status: AuthenticationStatus.authenticated,
          ),
        );
        break;
      case AuthenticationStatus.unAuthenticated:
        emit(
          const UnAuthenticated(
            status: AuthenticationStatus.unAuthenticated,
          ),
        );
        break;
    }
  }
}
