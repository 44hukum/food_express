import 'package:flutter/material.dart';
import 'package:foodcommerce/pages/profile.dart';
import 'package:foodcommerce/pages/search.dart';
import 'package:foodcommerce/screen/home.dart';
import 'package:foodcommerce/services/cart.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const RestaurantHome(),
    SearchLandingPage(),
    ProfilePage()
  ];

  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return PageView(
      controller: _pageController,
      children: [
        Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text('Ashish Tamang'),
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: const Text('Orders'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('History'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
          floatingActionButton: Consumer<CartModel>(
            builder: (context, cartProvider,_){
              return cartProvider.length() > 0 ?  GestureDetector(
                onTap: (){
                    Navigator.pushNamed(context, 'checkout');
                },
                child: Container(
                    width: 150,
                    height: 43,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.black
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('View Cart', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white,)
                      ],
                    )
                ),
              ): Container();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.orange,
            iconSize: 28,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'search', icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: 'profile', icon: Icon(Icons.person)),

            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ],
    );
  }
}
