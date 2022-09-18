part of 'bid_submit_bloc.dart';

abstract class BidSubmitState extends Equatable {
  const BidSubmitState();

  @override
  List<Object> get props => [];
}

class BidSubmitFormInitialInfoLoading extends BidSubmitState {
  const BidSubmitFormInitialInfoLoading();
  @override
  List<Object> get props => [];
}

class BidSubmitFormInitialInfoLoaded extends BidSubmitState {
  const BidSubmitFormInitialInfoLoaded();
  @override
  List<Object> get props => [];
}

class BidSubmitFormInfoValid extends BidSubmitState {
  const BidSubmitFormInfoValid();
  @override
  List<Object> get props => [];
}

class BidSubmitFormInfoInvalid extends BidSubmitState {
  const BidSubmitFormInfoInvalid();
  @override
  List<Object> get props => [];
}

class BidSubmitting extends BidSubmitState {
  const BidSubmitting();
  @override
  List<Object> get props => [];
}

class BidSubmitted extends BidSubmitState {
  const BidSubmitted();
  @override
  List<Object> get props => [];
}

class BidSubmissionError extends BidSubmitState {
  const BidSubmissionError({required this.errors});

  final Map<String, String> errors;

  @override
  List<Object> get props => [errors];
}
