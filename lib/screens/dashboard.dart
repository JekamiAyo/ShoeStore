import 'package:flutter/material.dart';
import 'package:shoe_store/screens/cartPage.dart';
import 'package:shoe_store/screens/shopPage.dart';
import 'package:shoe_store/widgets/bottomNavBar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

int _selectedIndex = 0;

class _DashBoardState extends State<DashBoard> {
  //navigation
  navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop Page
    const ShopPage(),
    //Cart Page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ))),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: GNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                      "lib/images/png-transparent-nike-logo-movement-brands-nike.png"),
                  const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.home_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Home"),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                      title: Text("About"),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text("Logout"),
                ),
              )
            ],
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
