import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_talky/src/model/user.dart';
import 'package:online_talky/src/pages/splash_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final User currentUser;
  static const String routeName = '/home-page';
  const HomePage({Key key, @required this.currentUser})
      : assert(currentUser != null),
        assert(currentUser is User),
        super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NetworkImage profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.currentUser.userName),
              accountEmail: Text(widget.currentUser.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.currentUser.avatarUrl,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Send me an email'),
              onTap: () async {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: widget.currentUser.email,
                  queryParameters: {'subject': 'Flutter is awesome!'},
                );
                await launch(_emailLaunchUri.toString());
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_outlined),
              title: Text('Call me'),
              onTap: () async {
                await launch('tel:${widget.currentUser.phoneNumber}');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text('Check my Twitter'),
              onTap: () async {
                await launch(widget.currentUser.twitterProfile);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Check my LinkedIn'),
              onTap: () async {
                await launch(widget.currentUser.linkedInProfile);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () {
                Navigator.pushReplacementNamed(context, SplashPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: profileImage,
          ),
          Text(
            widget.currentUser.userName,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontFamily: GoogleFonts.pacifico().fontFamily,
                ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
            color: Theme.of(context).accentColor,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 25.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.phone,
              ),
              title: Text(
                widget.currentUser.phoneNumber,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Card(
            color: Theme.of(context).accentColor,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 25.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                widget.currentUser.email,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    profileImage = NetworkImage(widget.currentUser.avatarUrl);
    super.initState();
  }
}
