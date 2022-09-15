import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bid_submit_event.dart';
part 'bid_submit_state.dart';

class BidSubmitBloc extends Bloc<BidSubmitEvent, BidSubmitState> {
  BidSubmitBloc() : super(BidSubmitFormInitialInfoLoaded()) {
    on<SubmitSupplierBid>(_onSubmitSupplierBid);
  }

  Future<void> _onSubmitSupplierBid(
    SubmitSupplierBid event,
    Emitter<BidSubmitState> emit,
  ) async {
    emit(BidSubmitted());
  }
}
