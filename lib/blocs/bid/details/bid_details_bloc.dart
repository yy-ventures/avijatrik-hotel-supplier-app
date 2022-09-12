import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:avijatrik_hotel_supplier_app/blocs/bid/details/bid_details_event.dart';
import 'package:avijatrik_hotel_supplier_app/blocs/bid/details/bid_details_state.dart';
import 'package:avijatrik_hotel_supplier_app/models/bid/bid_details.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/bid_service.dart';

class BidDetailsBloc extends Bloc<BidDetailsEvent, BidDetailsState> {
  BidDetailsBloc({required this.bidService}) : super(const BidLoading()) {
    on<GetBid>(_getBid);
  }

  final BidService bidService;

  Future<void> _getBid(
    GetBid event,
    Emitter<BidDetailsState> emit,
  ) async {
    final response = await bidService.getRunningBid();
    if (response.error == null && response.payload != null) {
      final payload = jsonDecode(response.payload);
      final bid = BidDetails.fromJson(payload);
      print(bid.supplierSubmittedBids!.length);
      print(bid.bidInfo?.userId);

      emit(BidLoaded(bid: bid));
    } else {
      if (response.statusCode == 400) {
        emit(const RunningBidNotFound());
      } else {
        emit(
          BidError(
            errors: response.error!.messages ?? {},
          ),
        );
      }
    }
  }
}
