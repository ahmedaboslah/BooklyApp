import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomurl(context, String Url) async {
  if (Url !=null) {
    Uri url = Uri.parse(Url);
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'can not launch $Url',
        ),
      ),
    );
  }
}
