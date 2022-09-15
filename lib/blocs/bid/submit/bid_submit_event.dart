part of 'bid_submit_bloc.dart';

abstract class BidSubmitEvent extends Equatable {
  const BidSubmitEvent();

  @override
  List<Object?> get props => [];
}

class SubmitSupplierBid extends BidSubmitEvent {
  const SubmitSupplierBid();

  @override
  List<Object?> get props => [];
}

class CheckSupplierBidInfoFormIsValid extends BidSubmitEvent {
  const CheckSupplierBidInfoFormIsValid();

  @override
  List<Object?> get props => [];
}
