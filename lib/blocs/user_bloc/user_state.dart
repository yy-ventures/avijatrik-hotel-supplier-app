part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserProfileLoaded extends UserState {
  @override
  List<Object> get props => [];
}
