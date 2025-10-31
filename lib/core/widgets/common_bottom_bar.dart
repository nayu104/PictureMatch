import 'package:flutter/material.dart';

/// 共通のボトムナビゲーションバー
class CommonBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CommonBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.pink[400],
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.pink[400],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.upload, color: Colors.white),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'プロフィール',
        ),
      ],
    );
  }
}
