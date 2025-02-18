import 'package:flutter/material.dart';

import '../../shop/wishlist.dart';
import '../../scanner/scanner.dart';
import '../home.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int currentIndex;
  //final ValueChanged<int> onTap;

  

  const CommonBottomNavBar({
    Key? key,
    required this.currentIndex,
    //required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showMessage(String message) {
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) {
            // Handle tap actions based on the index
            switch (index) {
              case 0:
                //_showMessage('Home tapped');
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );*/
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // No animation, just return the new page
                    },
                  ),
                );
                break;
              case 1:
                //_showMessage('Wishlist tapped');
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistPage(),
                  ),
                );*/
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => WishlistPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // No animation, just return the new page
                    },
                  ),
                );
                break;
              case 2:
                //_showMessage('Scanner tapped');
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannerScreen(),
                  ),
                );*/
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => ScannerScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // No animation, just return the new page
                    },
                  ),
                );
                break;
              case 3:
                _showMessage('Profile tapped');
                break;
            };
      }
    );
  }
}
