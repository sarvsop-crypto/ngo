import 'package:flutter/material.dart';

import '../../core/app_tokens.dart';
import 'app_nav_item.dart';

class AppDrawer extends StatelessWidget {
  final List<AppNavItem> items;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  const AppDrawer({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
          children: [
            const ListTile(
              title: Text('Asosiy bolimlar', style: TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text('OZNNTMA ilovasi'),
            ),
            const Divider(height: AppSpace.xl),
            for (var i = 0; i < items.length; i++)
              ListTile(
                leading: Icon(items[i].icon),
                title: Text(items[i].title),
                selected: i == activeIndex,
                selectedTileColor: const Color(0xFFE7F7FB),
                onTap: () => onSelect(i),
              ),
            const Divider(height: AppSpace.xl),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpace.lg),
              child: Text('Biz haqimizda ichida', style: TextStyle(fontSize: 12, color: AppTokens.textMuted, fontWeight: FontWeight.w600)),
            ),
            const ListTile(leading: Icon(Icons.chevron_right, size: 18), title: Text('Rahbariyat')),
            const ListTile(leading: Icon(Icons.chevron_right, size: 18), title: Text('Bizning jamoa')),
            const ListTile(leading: Icon(Icons.chevron_right, size: 18), title: Text('Tuzilma')),
          ],
        ),
      ),
    );
  }
}
