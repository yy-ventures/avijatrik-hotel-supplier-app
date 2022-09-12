import 'dart:convert';

import 'package:avijatrik_hotel_supplier_app/blocs/bid/history/bid_history_event.dart';
import 'package:avijatrik_hotel_supplier_app/blocs/bid/history/bid_history_state.dart';
import 'package:avijatrik_hotel_supplier_app/models/bid/bid_info.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/bid_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BidHistoryBloc extends Bloc<BidHistoryEvent, BidHistoryState> {
  BidHistoryBloc({required this.bidService}) : super(BidHistoryLoading()) {
    on<GetBidHistories>(_getBidHistories);
    on<GetMoreBidHistories>(_getMoreBidHistories);
  }

  final BidService bidService;
  int pageIndex = 1;
  int totalCount = 0;
  List<BidInfo> histories = [];

  Future<void> _getBidHistories(
    GetBidHistories event,
    Emitter<BidHistoryState> emit,
  ) async {
    final response = await bidService.getBids();
    if (response.error == null && response.payload != null) {
      final payload = jsonDecode(response.payload);
      final List list = payload['Data'];
      totalCount = payload['Meta']['TotalCount'];
      histories = list.map((item) => BidInfo.fromJson(item)).toList();

      if (histories.isNotEmpty) {
        emit(BidHistoryLoaded(
          histories: histories,
        ));
      } else {
        emit(const BidHistoryEmpty());
      }
    } else {
      emit(
        BidHistoryError(
          errors: response.error!.messages ?? {},
        ),
      );
    }
  }

  Future<void> _getMoreBidHistories(
    GetMoreBidHistories event,
    Emitter<BidHistoryState> emit,
  ) async {
    if (histories.length == totalCount) {
      return;
    }

    emit(
      BidHistoryLoaded(
        histories: histories,
        isLoading: true,
      ),
    );

    final response = await bidService.getBids(currentPage: pageIndex += 1);
    if (response.error == null && response.payload != null) {
      final payload = jsonDecode(response.payload);
      final List list = payload['Data'];
      totalCount = payload['Meta']['TotalCount'];
      histories += list.map((item) => BidInfo.fromJson(item)).toList();

      emit(BidHistoryLoaded(
        histories: histories,
      ));
    } else {
      emit(
        BidHistoryError(
          errors: response.error!.messages ?? {},
        ),
      );
    }
  }
}
