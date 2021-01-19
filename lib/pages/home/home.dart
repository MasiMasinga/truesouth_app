import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Public/Flutter/truesouth_app/lib/pages/recycle/recycle.dart';
import 'package:truesouth_app/pages/profile/profile.dart';

class Home extends StatelessWidget {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('TrueSouth Tech'),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              accountEmail: new Text(
                'johndoe@truesouth.com',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black,
                child: new Text("JD"),
              ),
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade700,
              ),
            ),
            new ListTile(
              title: new Text("Profile"),
              trailing: new Icon(Icons.person_rounded),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }
            ),
            new ListTile(
              trailing: new Icon(Icons.settings             ),
              title: new Text("Settings"),
              onTap: () {},
            ),
            new Divider(),
            //Section Line
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),

      // Menu
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              child: MyMenu(
                title: 'Recycle',
                icon: Icons.transfer_within_a_station,
                color: Colors.green,
              ),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecycleScreen()));
              },
            ),
            GestureDetector(
              child: MyMenu(
                title: 'Drop Off Locations',
                icon: Icons.location_pin,
                color: Colors.red,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: MyMenu(
                title: 'Wallet',
                icon: Icons.account_balance_wallet_outlined,
                color: Colors.pink,
              ),
              onTap: () {
              },
            ),
            GestureDetector(
              child: MyMenu(
                title: 'News',
                icon: Icons.accessibility_new_sharp,
                color: Colors.blue,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: MyMenu(
                title: 'Support',
                icon: Icons.help,
                color: Colors.yellow,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: MyMenu(
                title: 'About',
                icon: Icons.info,
                color: Colors.red,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.account_circle,
              title: "Profile",
              onclick: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              }),
          TabData(iconData: Icons.search, title: "Search", onclick: () {}),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {},
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.color});

  final String title;
  final IconData icon;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.blue,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: color,
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

