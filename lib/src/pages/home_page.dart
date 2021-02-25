import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_talky/src/model/user.dart';
import 'package:online_talky/src/widgets/app_drawer.dart';

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
      drawer: AppDrawer(currentUser: widget.currentUser),
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
