part of 'bottom_nav_bar_cubit.dart';

abstract class BottomNavBarState {
  final int currentIndex;

  const BottomNavBarState({required this.currentIndex});
}

class BottomNavBarInitial extends BottomNavBarState {
  BottomNavBarInitial() : super(currentIndex: 0);
}

class BottomNavBarHome extends BottomNavBarState {
  BottomNavBarHome() : super(currentIndex: 0);
}

class BottomNavBarRequests extends BottomNavBarState {
  BottomNavBarRequests() : super(currentIndex: 1);
}

class BottomNavBarSettings extends BottomNavBarState {
  BottomNavBarSettings() : super(currentIndex: 2);
}

