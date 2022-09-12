import 'package:avijatrik_hotel_supplier_app/models/bid/bid_details.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';
import 'package:equatable/equatable.dart';

abstract class BidDetailsState extends Equatable {
  const BidDetailsState();
}

class BidLoading extends BidDetailsState {
  const BidLoading();

  @override
  List<Object?> get props => [];
}

class BidLoaded extends BidDetailsState {
  const BidLoaded({required this.bid});
  final BidDetails bid;

  @override
  List<Object?> get props => [bid];
}

class RunningBidNotFound extends BidDetailsState {
  const RunningBidNotFound();

  @override
  List<Object?> get props => [];
}

class BidError extends BidDetailsState {
  const BidError({required this.errors});

  final Map<String, String> errors;

  @override
  List<Object?> get props => [errors];
}
