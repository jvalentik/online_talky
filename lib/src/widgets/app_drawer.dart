import 'package:flutter/material.dart';
import 'package:online_talky/src/model/user.dart';
import 'package:online_talky/src/pages/splash_page.dart';
import 'package:online_talky/src/widgets/menu_item.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  final User currentUser;
  const AppDrawer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(currentUser.userName),
            accountEmail: Text(currentUser.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                currentUser.avatarUrl,
              ),
            ),
          ),
          MenuItem(
            icon: Icon(Icons.email),
            label: 'Send me an email',
            onItemClicked: () async {
              final Uri _emailLaunchUri = Uri(
                scheme: 'mailto',
                path: currentUser.email,
                queryParameters: {'subject': 'Flutter is awesome!'},
              );
              await launch(_emailLaunchUri.toString());
              Navigator.pop(context);
            },
          ),
          MenuItem(
            icon: Icon(Icons.phone_outlined),
            label: 'Call me',
            onItemClicked: () async {
              await launch('tel:${currentUser.phoneNumber}');
              Navigator.pop(context);
            },
          ),
          MenuItem(
            icon: Icon(Icons.contact_page_outlined),
            label: 'Check my Twitter',
            onItemClicked: () async {
              await launch(
                currentUser.twitterProfile,
                forceWebView: true,
                enableJavaScript: true,
              );
              Navigator.pop(context);
            },
          ),
          MenuItem(
            icon: Icon(Icons.favorite_border),
            label: 'Check my LinkedIn',
            onItemClicked: () async {
              await launch(currentUser.linkedInProfile);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          MenuItem(
            icon: Icon(Icons.logout),
            label: 'Sign out',
            onItemClicked: () => Navigator.pushReplacementNamed(context, SplashPage.routeName),
          ),
        ],
      ),
    );
  }
}
