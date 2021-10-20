import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/user_profile.dart';
import 'package:food_delivery_app/Ui/screens/cart_screen/cart_screen.dart';
import 'package:food_delivery_app/Ui/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/Ui/screens/search/seach_screen.dart';
import 'bot_navi_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<bool> indexForNavigator = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: widget.size.height * 0.07,
          width: widget.size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomBotNavigationIcon(
                  isPressed: indexForNavigator[0],
                  icon: Icons.home_outlined,
                  text: "Home",
                  onPress: () {
                    indexForNavigator[0] = true;
                    indexForNavigator[1] = false;
                    indexForNavigator[2] = false;
                    indexForNavigator[3] = false;
                    Navigator.pushReplacement((context),
                        MaterialPageRoute(builder: (contex) {
                      return const HomeScreen();
                    }));
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: CustomBotNavigationIcon(
                  isPressed: indexForNavigator[1],
                  icon: Icons.shopping_bag_outlined,
                  text: "Cart",
                  onPress: () {
                    indexForNavigator[0] = false;
                    indexForNavigator[1] = true;
                    indexForNavigator[2] = false;
                    indexForNavigator[3] = false;
                    Navigator.push((context),
                        MaterialPageRoute(builder: (contex) {
                      return const CartScreen();
                    }));
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: CustomBotNavigationIcon(
                  isPressed: indexForNavigator[2],
                  icon: Icons.search,
                  text: "Search",
                  onPress: () {
                    indexForNavigator[0] = false;
                    indexForNavigator[1] = false;
                    indexForNavigator[2] = true;
                    indexForNavigator[3] = false;
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchScreen();
                      }));
                    });
                  },
                ),
              ),
              Expanded(
                child: CustomBotNavigationIcon(
                  isPressed: indexForNavigator[3],
                  icon: Icons.person_outline,
                  text: "Me",
                  onPress: () {
                    indexForNavigator[0] = false;
                    indexForNavigator[1] = false;
                    indexForNavigator[2] = false;
                    indexForNavigator[3] = true;
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (cotext) {
                        return ProfileScreen();
                      }));
                    });
                  },
                ),
              ),
            ],
          )),
    );
  }
}
