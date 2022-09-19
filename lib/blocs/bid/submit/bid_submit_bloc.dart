import 'package:avijatrik_hotel_supplier_app/payloads/supplier_bid_payload.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/bid_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bid_submit_event.dart';
part 'bid_submit_state.dart';

class BidSubmitBloc extends Bloc<BidSubmitEvent, BidSubmitState> {
  BidSubmitBloc({required this.bidService})
      : super(const BidSubmitFormInitialInfoLoaded()) {
    on<SubmitSupplierBid>(_onSubmitSupplierBid);
    on<CheckOfferPriceIsValid>(_onCheckOfferPriceIsValid);
  }

  final BidService bidService;

  Future<void> _onSubmitSupplierBid(
    SubmitSupplierBid event,
    Emitter<BidSubmitState> emit,
  ) async {
    emit(const BidSubmitting());

    final response = await bidService.submitSupplierBid(event.supplierBid);

    if (response.error == null && response.statusCode == 200) {
      emit(const BidSubmitted());
    } else {
      emit(
        BidSubmissionError(
          errors: response.error!.messages ?? {},
        ),
      );
    }
  }

  Future<void> _onCheckOfferPriceIsValid(
    CheckOfferPriceIsValid event,
    Emitter<BidSubmitState> emit,
  ) async {
    final int regularPrice = int.parse(event.regularPrice);
    final int offerPrice = int.parse(event.offerPrice);

    if (regularPrice <= offerPrice) {
      emit(const BidSubmitOfferPriceInvalid());
    } else {
      emit(const BidSubmitFormInfoValid());
    }
  }
}
