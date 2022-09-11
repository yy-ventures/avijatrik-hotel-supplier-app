part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState({required this.screenIndex});
  final int screenIndex;

  @override
  List<Object> get props => [screenIndex];
}

class BottomNavigationScreenChange extends BottomNavigationState {
  const BottomNavigationScreenChange({required super.screenIndex});
}
