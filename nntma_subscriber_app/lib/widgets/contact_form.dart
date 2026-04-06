import 'package:flutter/material.dart';

import '../core/app_breakpoints.dart';
import '../core/app_tokens.dart';

class ContactCards extends StatelessWidget {
  final Widget left;
  final Widget right;

  const ContactCards({super.key, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final bp = breakpointOf(c.maxWidth);
        if (bp == AppBreakpoint.phone) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              left,
              const SizedBox(height: AppSpace.md),
              right,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: AppSpace.md),
            Expanded(child: right),
          ],
        );
      },
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Murojaat yuborildi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.lg),
      decoration: BoxDecoration(
        color: AppTokens.surface,
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
        border: Border.all(color: AppTokens.border),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _FormField(
              label: 'Ism va familiya',
              controller: _name,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Ismni kiriting' : null,
            ),
            const SizedBox(height: AppSpace.md),
            _FormField(
              label: 'Email',
              controller: _email,
              validator: (v) {
                final value = (v ?? '').trim();
                if (value.isEmpty) return 'Emailni kiriting';
                if (!value.contains('@')) return 'Email notogri formatda';
                return null;
              },
            ),
            const SizedBox(height: AppSpace.md),
            _FormField(
              label: 'Mavzu',
              controller: _subject,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Mavzuni kiriting' : null,
            ),
            const SizedBox(height: AppSpace.md),
            _FormField(
              label: 'Xabar',
              controller: _message,
              maxLines: 4,
              validator: (v) => (v == null || v.trim().length < 10) ? 'Kamida 10 ta belgi kiriting' : null,
            ),
            const SizedBox(height: AppSpace.lg),
            SizedBox(
              width: double.infinity,
              child: Semantics(
                button: true,
                label: 'Murojaat yuborish tugmasi',
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTokens.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _submit,
                  child: const Text('Yuborish'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;

  const _FormField({
    required this.label,
    required this.controller,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppTokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppTokens.border),
        ),
      ),
    );
  }
}
