import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _buildBottomNavigationBarItem(
          icon: Icons.home,
          label: 'Inicio',
          index: 0,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.calendar_today,
          label: 'Calendario',
          index: 1,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.bar_chart,
          label: 'Estadísticas',
          index: 2,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.group,
          label: 'Equipos',
          index: 3,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.person,
          label: 'Usuario',
          index: 4,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: onTap,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (currentIndex == index)
            Container(
              width: 82,
              height: 3,
              margin: const EdgeInsets.only(bottom: 5), // Adjust the margin to position the bar above the icon
              decoration: BoxDecoration(
                color: Colors.amber[800],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          Icon(
            icon,
            color: currentIndex == index ? Colors.amber[800] : Colors.grey,
          ),
        ],
      ),
      label: label,
    );
  }
}