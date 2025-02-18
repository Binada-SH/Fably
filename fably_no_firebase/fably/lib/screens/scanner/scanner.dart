import 'package:flutter/material.dart';
import 'camera.dart';
import '../scanner/scanner.dart';
import '../home/home.dart';
import '../shop/wishlist.dart';
import '../home/widgets/common_drawer.dart';
import '../../utils/requests.dart';
import '../shop/cart.dart';
import '../auth/login.dart';
import '../home/widgets/bottom_nav_bar.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backButton = IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );

    void _showMessage(String message) {
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    Future<void> signOut() async {
    final requests = BackendRequests();

    try{
      final response = await requests.getRequest('logout');
      if (response.statusCode==200){

      }
    }catch (e) {
      _showMessage('Error Loging out: $e');
    }

  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Your Body'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                  //builder: (context) => ProductPage(product: myProduct),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      drawer: CommonDrawer(),
      /*appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            backButton,
            const SizedBox(height: 12),
            const Text(
              'Scan your body',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/Gif_fably.gif',
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 25),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
              child: const Text('Continue'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
      bottomNavigationBar: CommonBottomNavBar(
        currentIndex: 2,
        //onTap: _onNavBarTap,
      ),
    );
  }
}
