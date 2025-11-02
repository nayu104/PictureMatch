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
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1DA1F2), Color(0xFF0d8bd9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1DA1F2).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              // TODO: 画像アップロード機能を実装
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
