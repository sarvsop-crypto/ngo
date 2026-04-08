import 'package:flutter/material.dart';

import '../../core/app_i18n.dart';
import '../../core/app_routes.dart';
import '../../core/app_tokens.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/responsive_section.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    String l({
      required String uz,
      required String cy,
      required String ru,
      required String en,
    }) =>
        context.i18n.pick(uzLatin: uz, uzCyrillic: cy, russian: ru, english: en);

    return PageScaffold(
      heroTitle: '404',
      heroSub: l(
        uz: "Sahifa topilmadi. Muammo biz tomonda, uzr so'raymiz.",
        cy: 'Саҳифа топилмади. Муаммо биз томонда, узр сўраймиз.',
        ru: 'Страница не найдена. Похоже, произошла ошибка на нашей стороне.',
        en: 'Page not found. Looks like something is broken on our side.',
      ),
      children: [
        ResponsiveSection(
          title: l(uz: 'Sahifa topilmadi', cy: 'Саҳифа топилмади', ru: 'Страница не найдена', en: 'Page not found'),
          subtitle: l(
            uz: "Siz qidirgan sahifa mavjud emas yoki boshqa manzilga ko'chirilgan.",
            cy: 'Сиз қидирган саҳифа мавжуд эмас ёки бошқа манзилга кўчирилган.',
            ru: 'Искомая страница отсутствует или была перемещена.',
            en: 'The page you are looking for does not exist or has been moved.',
          ),
          child: Center(
            child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppTokens.primaryDark),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false),
              child: Text(l(uz: 'Bosh sahifaga qaytish', cy: 'Бош саҳифага қайтиш', ru: 'На главную', en: 'Back home')),
            ),
          ),
        ),
      ],
    );
  }
}
