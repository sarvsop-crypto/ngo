import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../core/app_i18n.dart';
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
  final VoidCallback? onRetry;

  const SectionStateView({
    super.key,
    required this.state,
    required this.readyChild,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 420;
    final statePadding = isNarrow ? AppSpace.lg : AppSpace.xl;
    switch (state) {
      case LoadState.idle:
        return const SizedBox.shrink();
      case LoadState.loading:
        return Padding(
          padding: EdgeInsets.all(statePadding),
          child: Center(child: CircularProgressIndicator()),
        );
      case LoadState.empty:
        return _StatePanel(
          icon: PhosphorIconsRegular.tray,
          text: context.i18n.pick(
            uzLatin: "Hozircha ma'lumot yo'q",
            uzCyrillic: "Ҳозирча маълумот йўқ",
            russian: 'Пока данных нет',
            english: 'No data yet',
          ),
          onRetry: onRetry,
          compact: isNarrow,
        );
      case LoadState.error:
        return _StatePanel(
          icon: PhosphorIconsRegular.warningCircle,
          text: context.i18n.pick(
            uzLatin: "Yuklashda xatolik yuz berdi",
            uzCyrillic: 'Юклашда хатолик юз берди',
            russian: 'Произошла ошибка загрузки',
            english: 'Loading failed',
          ),
          onRetry: onRetry,
          compact: isNarrow,
        );
      case LoadState.ready:
        return readyChild;
    }
  }
}

class _StatePanel extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onRetry;
  final bool compact;

  const _StatePanel({
    required this.icon,
    required this.text,
    this.onRetry,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? AppSpace.lg : AppSpace.xl),
      decoration: BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: AppTokens.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(icon, color: AppTokens.textMuted),
          const SizedBox(height: AppSpace.sm),
          Text(text, style: const TextStyle(color: AppTokens.textMuted)),
          if (onRetry != null) ...[
            const SizedBox(height: AppSpace.md),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const PhosphorIcon(PhosphorIconsRegular.arrowsClockwise),
              label: Text(
                context.i18n.pick(
                  uzLatin: 'Qayta yuklash',
                  uzCyrillic: 'Қайта юклаш',
                  russian: 'Повторить',
                  english: 'Retry',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
