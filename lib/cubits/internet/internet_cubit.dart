import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({required this.connectivity})
      : super(
          InternetConnectionChecking(),
        ) {
    getInternetStatus();
  }

  void getInternetStatus() {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

// _onPressedRetryButton(){}
// @override
// Future<void> close() {
//   connectivityStreamSubscription.cancel();
//
//   return super.close();
// }
}
