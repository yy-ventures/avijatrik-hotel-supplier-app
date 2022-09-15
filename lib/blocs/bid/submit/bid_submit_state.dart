part of 'bid_submit_bloc.dart';

abstract class BidSubmitState extends Equatable {
  const BidSubmitState();

  @override
  List<Object> get props => [];
}

class BidSubmitFormInitialInfoLoading extends BidSubmitState {}

class BidSubmitFormInitialInfoLoaded extends BidSubmitState {}

class BidSubmitFormInfoValid extends BidSubmitState {}

class BidSubmitFormInfoInvalid extends BidSubmitState {}

class BidSubmitting extends BidSubmitState {}

class BidSubmitted extends BidSubmitState {}

class BidSubmissionError extends BidSubmitState {}
