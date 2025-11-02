import 'package:flutter/material.dart';

/// 共通のボトムナビゲーションバー
class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

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
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
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
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'プロフィール',
        ),
      ],
    );
  }
}
