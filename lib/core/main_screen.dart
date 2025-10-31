import 'package:flutter/material.dart';
import 'package:pm/features/home/presentation/page/home_screen.dart';
import 'package:pm/features/profile/presentation/page/profile_screen.dart';
import '../core/widgets/common_bottom_bar.dart';

/// メイン画面（タブナビゲーションを管理）
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 各タブに対応する画面のリスト
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('アップロード画面（未実装）'),
      ),
    ),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CommonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
