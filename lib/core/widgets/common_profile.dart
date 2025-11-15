import 'package:flutter/material.dart';
import 'package:pm/features/profile/presentation/page/profile_screen.dart';

/// プロフィールアイコンボタン
class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const ProfileScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.person,
            size: 30,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
