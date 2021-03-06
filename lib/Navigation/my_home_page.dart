import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/user_profile.dart';
import 'package:food_delivery_app/Ui/screens/cart_screen/cart_screen.dart';
import 'package:food_delivery_app/Ui/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/Ui/screens/search/search_screen.dart';
import 'package:food_delivery_app/constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _inactiveColor = Colors.grey;
  final _activeColor = ConstantColor.orange;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            });
          },
          currentIndex: _currentIndex,
          unselectedItemColor: _inactiveColor,
          selectedItemColor: _activeColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Me')
          ],
        ));
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomeScreen(),
      const CartScreen(),
      const SearchScreen(),
      const ProfileScreen(),
    ];
    // return IndexedStack(
    //   index: _currentIndex,
    //   children: pages,
    // );
    return PageView(
      controller: _pageController,
      onPageChanged: (pageIndex) {
        setState(() {
          _currentIndex = pageIndex;
        });
      },
      children: pages,
    );
  }

//   Widget _buildBottomBar() {
//     return CustomAnimatedBottomBar(
//       containerHeight: 65,
//       backgroundColor: Colors.white,
//       selectedIndex: _currentIndex,
//       showElevation: true,
//       itemCornerRadius: 24,
//       curve: Curves.easeIn,
//       onItemSelected: (index) => setState(() => _currentIndex = index),
//       items: <BottomNavyBarItem>[
//         BottomNavyBarItem(
//           icon: const Icon(Icons.home_outlined),
//           title: const Text('Home'),
//           activeColor: _activeColor,
//           inactiveColor: _inactiveColor,
//           textAlign: TextAlign.center,
//         ),
//         BottomNavyBarItem(
//           icon: const Icon(Icons.shopping_bag_outlined),
//           title: const Text('Cart'),
//           activeColor: _activeColor,
//           inactiveColor: _inactiveColor,
//           textAlign: TextAlign.center,
//         ),
//         BottomNavyBarItem(
//           icon: const Icon(Icons.search_outlined),
//           title: const Text(
//             'Search',
//           ),
//           activeColor: _activeColor,
//           inactiveColor: _inactiveColor,
//           textAlign: TextAlign.center,
//         ),
//         BottomNavyBarItem(
//           icon: const Icon(Icons.person_outline),
//           title: const Text('Me'),
//           activeColor: _activeColor,
//           inactiveColor: _inactiveColor,
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
}
