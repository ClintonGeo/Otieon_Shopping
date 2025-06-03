import 'package:flutter/material.dart';
import 'package:otieon/screens/account_screen.dart';
import 'package:otieon/screens/cart_screen.dart';
import 'package:otieon/screens/category_screen.dart';
import 'package:otieon/screens/home_screen_one.dart';
import 'package:otieon/screens/member_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;



  final List<Widget> _screens = [
    HomeScreenOne(),
   CategoryScreen(),
   MemberScreen(),
   AccountScreen(),
   CartScreen(),

    
  ];

  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: const Color(0xFFFFFFFF),
          leadingWidth: 130,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
        
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Ink(
                     height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff04763F),
                            Color(0xffA1CB39),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child:const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Icon(Icons.location_on, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Select a hub',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.chevron_right, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _itemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff04763F),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ,),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.workspace_premium), label: 'Member'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'cart')
          ],
        ),
      ),
    );
  }
}
