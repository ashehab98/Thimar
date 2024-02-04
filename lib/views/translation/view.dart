import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:thimar/generated/locale_keys.g.dart';

class TranslationView extends StatelessWidget {
  const TranslationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(LocaleKeys.hello.tr()),
          IconButton(
            onPressed: () {
                 String code = context.locale.languageCode == "en"?"ar":"en";
              context.setLocale(Locale(code),);
            },
            icon: const Icon(
              Icons.language,
            ),
          ),
        ]),
      ),
    ));
  }
}
