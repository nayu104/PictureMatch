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
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
                colors: [Color.fromARGB(255, 234, 37, 37), Color.fromARGB(255, 244, 145, 253)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.photo_library, color: Colors.white),
          ),
          label: '出会う',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'いいね',
        ),
      ],
    );
  }
}
