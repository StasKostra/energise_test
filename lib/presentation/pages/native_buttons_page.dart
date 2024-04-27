import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NativeButtonsPage extends StatelessWidget {
  NativeButtonsPage({super.key});

  final rate = RateMyApp(
    minDays: 10,
    minLaunches: 10,
    remindLaunches: 1,
    googlePlayIdentifier: 'app.openauthenticator',
    appStoreIdentifier: '6479272927',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    rate.launchNativeReviewDialog();
                  },
                  child: Text(AppLocalizations.of(context)!.rateApp)),
              ElevatedButton(
                  onPressed: () {
                    Share.share('Share my app https://energise.pro');
                  },
                  child: Text(AppLocalizations.of(context)!.shareApp)),
              ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7'));
                  },
                  child: Text(AppLocalizations.of(context)!.contactUs)),
            ],
          ),
        ),
      ),
    );
  }
}
