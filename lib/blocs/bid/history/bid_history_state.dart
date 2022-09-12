import 'package:avijatrik_hotel_supplier_app/models/bid/bid_info.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:equatable/equatable.dart';

abstract class BidHistoryState extends Equatable {
  const BidHistoryState();
}

class BidHistoryLoading extends BidHistoryState {
  @override
  List<Object?> get props => [];
}

class BidHistoryLoaded extends BidHistoryState {
  const BidHistoryLoaded({
    required this.histories,
    this.isLoading = false,
  });

  final List<BidInfo> histories;
  final bool isLoading;

  @override
  List<Object?> get props => [histories, isLoading];
}

class BidHistoryEmpty extends BidHistoryState {
  const BidHistoryEmpty();

  @override
  List<Object?> get props => [];
}

class BidHistoryError extends BidHistoryState {
  const BidHistoryError({required this.errors});

  final Map<String, String> errors;

  @override
  List<Object?> get props => [errors];
}
