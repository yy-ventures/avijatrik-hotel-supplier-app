// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeScreen extends BottomNavigationEvent {
  final int screenIndex;
  const ChangeScreen({required this.screenIndex});

  @override
  List<Object> get props => [screenIndex];
}
