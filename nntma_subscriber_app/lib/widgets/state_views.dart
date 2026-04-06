import 'package:flutter/material.dart';

import '../core/app_tokens.dart';
import '../core/load_state.dart';

LoadState loadStateFromSnapshot<T>(AsyncSnapshot<List<T>> snapshot) {
  if (snapshot.connectionState != ConnectionState.done) return LoadState.loading;
  if (snapshot.hasError) return LoadState.error;
  final items = snapshot.data ?? const [];
  if (items.isEmpty) return LoadState.empty;
  return LoadState.ready;
}

class SectionStateView extends StatelessWidget {
  final LoadState state;
  final Widget readyChild;

  const SectionStateView({super.key, required this.state, required this.readyChild});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoadState.idle:
        return const SizedBox.shrink();
      case LoadState.loading:
        return const Padding(
          padding: EdgeInsets.all(AppSpace.xl),
          child: Center(child: CircularProgressIndicator()),
        );
      case LoadState.empty:
        return const _StatePanel(icon: Icons.inbox_outlined, text: 'Hozircha malumot yoq');
      case LoadState.error:
        return const _StatePanel(icon: Icons.error_outline, text: 'Yuklashda xatolik yuz berdi');
      case LoadState.ready:
        return readyChild;
    }
  }
}

class _StatePanel extends StatelessWidget {
  final IconData icon;
  final String text;

  const _StatePanel({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpace.xl),
      decoration: BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTokens.textMuted),
          const SizedBox(height: AppSpace.sm),
          Text(text, style: const TextStyle(color: AppTokens.textMuted)),
        ],
      ),
    );
  }
}
