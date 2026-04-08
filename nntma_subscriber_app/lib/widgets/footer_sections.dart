import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../core/app_i18n.dart';
import '../core/app_tokens.dart';
import 'content_container.dart';

class DarkCta extends StatelessWidget {
  const DarkCta({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = context.i18n;
    return Container(
      color: AppTokens.navy,
      child: ContentContainer(
        padding: const EdgeInsets.fromLTRB(AppSpace.xl, AppSpace.xl, AppSpace.xl, AppSpace.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              i18n.pick(
                uzLatin: "Rasmiy murojaat, hamkorlik va ma'lumot olish uchun biz bilan bog'laning.",
                uzCyrillic: 'Расмий мурожаат, ҳамкорлик ва маълумот олиш учун биз билан боғланинг.',
                russian: 'Свяжитесь с нами для официальных обращений, сотрудничества и получения информации.',
                english: 'Contact us for official requests, partnerships, and information.',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700, height: 1.2),
            ),
            const SizedBox(height: AppSpace.lg),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppTokens.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                i18n.pick(
                  uzLatin: "Bog'lanish",
                  uzCyrillic: 'Боғланиш',
                  russian: 'Связаться',
                  english: 'Contact us',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTokens.navy,
      child: ContentContainer(
        padding: const EdgeInsets.fromLTRB(AppSpace.xl, 0, AppSpace.xl, AppSpace.xl),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: AppTokens.primaryDark),
            SizedBox(height: AppSpace.lg),
            _FooterTop(),
            SizedBox(height: AppSpace.lg),
            Divider(color: AppTokens.primaryDark),
            SizedBox(height: AppSpace.md),
            _FooterBottom(),
          ],
        ),
      ),
    );
  }
}

class _FooterTop extends StatelessWidget {
  const _FooterTop();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 860;
        if (narrow) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FooterInfo(),
              SizedBox(height: AppSpace.lg),
              _FooterMapCard(),
            ],
          );
        }
        return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _FooterInfo()),
            SizedBox(width: AppSpace.lg),
            Expanded(flex: 2, child: _FooterMapCard()),
          ],
        );
      },
    );
  }
}

class _FooterInfo extends StatelessWidget {
  const _FooterInfo();

  @override
  Widget build(BuildContext context) {
    final i18n = context.i18n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(i18n.t('footer.quick_links'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(i18n.t('footer.link.about'), style: const TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        Text(i18n.t('footer.link.news'), style: const TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        Text(i18n.t('footer.link.events'), style: const TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        Text(i18n.t('footer.link.membership'), style: const TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        Text(i18n.t('footer.link.grants'), style: const TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 16),
        Text(i18n.t('footer.contact'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const Text('Tel: (+998 55) 503-05-12', style: TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        const Text('Email: info@ngo.uz', style: TextStyle(color: AppTokens.textFooter)),
        const SizedBox(height: 6),
        Text(
          i18n.pick(
            uzLatin: "1A, Furqat ko'chasi, Shayxontohur t., Toshkent, 100170",
            uzCyrillic: '1A, Фурқат кўчаси, Шайхонтоҳур т., Тошкент, 100170',
            russian: 'ул. Фурката, 1A, Шайхантахурский р-н, Ташкент, 100170',
            english: '1A Furqat street, Shaykhontohur district, Tashkent, 100170',
          ),
          style: const TextStyle(color: AppTokens.textFooter),
        ),
        const SizedBox(height: 16),
        Text(i18n.t('footer.social'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        const _SocialRow(),
      ],
    );
  }
}

class _FooterMapCard extends StatelessWidget {
  const _FooterMapCard();

  static const _mapImage =
      'https://static-maps.yandex.ru/1.x/?lang=uz_UZ&ll=69.240568,41.312565&z=16&size=650,370&l=map&pt=69.240568,41.312565,pm2rdm';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              _mapImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF123E4A)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: const Color(0xB3023347),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  context.i18n.pick(
                    uzLatin: "1A, Furqat ko'chasi, Shayxontohur t., Toshkent, 100170",
                    uzCyrillic: '1A, Фурқат кўчаси, Шайхонтоҳур т., Тошкент, 100170',
                    russian: 'ул. Фурката, 1A, Шайхантахурский р-н, Ташкент, 100170',
                    english: '1A Furqat street, Shaykhontohur district, Tashkent, 100170',
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterBottom extends StatelessWidget {
  const _FooterBottom();

  @override
  Widget build(BuildContext context) {
    final i18n = context.i18n;
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 8,
      spacing: 16,
      children: [
        Text(i18n.t('footer.copy'), style: const TextStyle(color: AppTokens.textFooter, fontSize: 12)),
        const Text('info@ngo.uz', style: TextStyle(color: AppTokens.textFooter, fontSize: 12)),
        Text(
          '${i18n.t('footer.address_label')} ${i18n.pick(uzLatin: "1A, Furqat ko'chasi, Shayxontohur t., Toshkent, 100170", uzCyrillic: '1A, Фурқат кўчаси, Шайхонтоҳур т., Тошкент, 100170', russian: 'ул. Фурката, 1A, Шайхантахурский р-н, Ташкент, 100170', english: '1A Furqat street, Shaykhontohur district, Tashkent, 100170')}',
          style: const TextStyle(color: AppTokens.textFooter, fontSize: 12),
        ),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _SocialIcon(PhosphorIconsRegular.facebookLogo),
        SizedBox(width: 8),
        _SocialIcon(PhosphorIconsRegular.instagramLogo),
        SizedBox(width: 8),
        _SocialIcon(PhosphorIconsRegular.telegramLogo),
        SizedBox(width: 8),
        _SocialIcon(PhosphorIconsRegular.youtubeLogo),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 14),
    );
  }
}
