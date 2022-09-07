part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeHomeScreenIndex extends HomeEvent {
  final int screenIndex;
  const ChangeHomeScreenIndex({required this.screenIndex});

  @override
  List<Object> get props => [screenIndex];
}
