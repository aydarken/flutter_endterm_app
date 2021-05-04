import 'package:flutter_endterm_app/constants/app_contsants.dart';
import 'package:flutter_endterm_app/constants/pref_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_promotions.dart';
import 'view_receipts.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
      final phonenumber = prefs.getString(PrefConstants.LOGGED_PHONE) ?? '07';
      final name = prefs.getString(PrefConstants.LOGGED_NAME) ?? 'Web';

      return new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(phonenumber),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage(AppConstants.APP_LOGO),
              ),
            ),
            new ListTile(
              leading: Icon(Icons.fingerprint),
              title: new Text('Promotions'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext contex) =>
                            ViewPromotions(prefs: prefs)));
              },
            ),
            new ListTile(
              leading: Icon(Icons.textsms),
              title: new Text('Tickets'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext contex) =>
                            ViewReceipts(prefs: prefs)));
              },
            ),
          ],
        ),
      );

  }
}
