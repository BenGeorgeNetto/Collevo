import 'package:collevo/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            BlocProvider.of<BottomNavBarCubit>(context).selectTab(index);
            _navigateToPage(context, index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/view_requests');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/settings');
        break;
      default:
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}
