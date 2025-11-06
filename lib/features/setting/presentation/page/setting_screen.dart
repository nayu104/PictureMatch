import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 設定画面
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '設定',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('アカウント'),
          _buildSettingTile(
            icon: Icons.email,
            title: 'メールアドレス',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.lock,
            title: 'パスワード変更',
            onTap: () {},
          ),
          const Divider(),

          _buildSectionTitle('通知'),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: 'プッシュ通知',
            value: true,
            onChanged: (value) {},
          ),
          _buildSwitchTile(
            icon: Icons.favorite,
            title: 'いいね通知',
            value: true,
            onChanged: (value) {},
          ),
          _buildSwitchTile(
            icon: Icons.people,
            title: 'フォロー通知',
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),

          _buildSectionTitle('プライバシー'),
          _buildSwitchTile(
            icon: Icons.public,
            title: 'プロフィールを公開',
            value: true,
            onChanged: (value) {},
          ),
          _buildSettingTile(
            icon: Icons.block,
            title: 'ブロックユーザー',
            onTap: () {},
          ),
          const Divider(),

          _buildSectionTitle('その他'),
          _buildSettingTile(
            icon: Icons.description,
            title: '利用規約',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.privacy_tip,
            title: 'プライバシーポリシー',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.help,
            title: 'お問い合わせ',
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.info,
            title: 'アプリのバージョン',
            subtitle: '1.0.0',
            onTap: () {},
          ),
          const Divider(),

          _buildSettingTile(
            icon: Icons.logout,
            title: 'ログアウト',
            titleColor: Colors.red,
            onTap: () {
              // ログアウト処理
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: titleColor ?? Colors.black),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 16,
          color: titleColor ?? Colors.black,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            )
          : null,
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 16,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.pink[400],
      ),
    );
  }
}
