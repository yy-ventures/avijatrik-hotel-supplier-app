import 'package:equatable/equatable.dart';

abstract class BidHistoryEvent extends Equatable{
  const BidHistoryEvent();
}

class GetBidHistories extends BidHistoryEvent {
  const GetBidHistories();

  @override
  List<Object?> get props => [];
}

class GetMoreBidHistories extends BidHistoryEvent {
  const GetMoreBidHistories();

  @override
  List<Object?> get props => [];
}
