part of 'bid_submit_bloc.dart';

abstract class BidSubmitEvent extends Equatable {
  const BidSubmitEvent();

  @override
  List<Object?> get props => [];
}

class SubmitSupplierBid extends BidSubmitEvent {
  const SubmitSupplierBid({required this.supplierBid});

  final SupplierBidSubmitPayload supplierBid;

  @override
  List<Object?> get props => [supplierBid];
}

class CheckSupplierBidInfoFormIsValid extends BidSubmitEvent {
  const CheckSupplierBidInfoFormIsValid();

  @override
  List<Object?> get props => [];
}

class CheckOfferPriceIsValid extends BidSubmitEvent {
  const CheckOfferPriceIsValid({
    required this.regularPrice,
    required this.offerPrice,
  });

  final String regularPrice;
  final String offerPrice;

  @override
  List<Object?> get props => [regularPrice, offerPrice];
}
