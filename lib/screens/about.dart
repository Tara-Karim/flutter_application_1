import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(AppLocalizations.of(context)!.about)), 
    body: Container(
      padding: EdgeInsets.all(20),
      child: Text(AppLocalizations.of(context)!.aboutText, style: TextStyle(fontSize: 28))));
  }
}