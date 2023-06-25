import 'package:bloc/bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  void selectTab(int index) {
    switch (index) {
      case 0:
        emit(BottomNavBarHome());
        break;
      case 1:
        emit(BottomNavBarRequests());
        break;
      case 2:
        emit(BottomNavBarSettings());
        break;
      default:
        emit(BottomNavBarHome());
    }
  }
}
