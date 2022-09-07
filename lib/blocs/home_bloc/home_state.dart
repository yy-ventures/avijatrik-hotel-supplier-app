part of 'home_bloc.dart';

// State Constructor
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// State
class HomeScreenIndexState extends HomeState {
  final int screenIndex;
  const HomeScreenIndexState({required this.screenIndex});

  @override
  List<Object> get props => [screenIndex];
}
