import 'package:equatable/equatable.dart';

abstract class BidDetailsEvent extends Equatable{
  const BidDetailsEvent();
}

class GetBid extends BidDetailsEvent {
  const GetBid();

  @override
  List<Object?> get props => [];
}