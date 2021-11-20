import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Ui/screens/Profile/components/decorated_list.dart';
import 'package:food_delivery_app/Ui/screens/Profile/components/user_info.dart';
import 'package:food_delivery_app/Ui/screens/Profile/pages/my_account.dart';
import 'package:food_delivery_app/Ui/widgets/custom_background.dart';

import 'package:food_delivery_app/repository/user_repository.dart';


class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody>
    with AutomaticKeepAliveClientMixin {
  final _userRepository = UserRepository();
  late Future<_auth.User?> userFuture;
  @override
  void initState() {
    userFuture = _userRepository.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    super.build(context);
    return FutureBuilder<_auth.User?>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Column(
              children: [
                CustomBackground(
                  size: size,
                  widget: UserInfo(user: snapshot.data),
                ),
                Expanded(
                  child: menuBuilder(
                      iconSize: 20, textSize: 20, user: snapshot.data!),
                )
              ],
            );
          } else {
            return Column(
              children: [
                CustomBackground(size: size),
                const Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          }
        });
  }

  Widget menuBuilder(
      {required double iconSize,
      required double textSize,
      required _auth.User user}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DecoratedListMenu(
            icon: Icons.person_outline,
            textSize: textSize,
            iconSize: iconSize,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyAccount(
                            user: user,
                          )));
            },
            title: 'My Account',
          ),
          DecoratedListMenu(
            icon: Icons.shopping_bag_outlined,
            textSize: textSize,
            iconSize: iconSize,
            onPress: () {},
            title: 'My Order',
          ),
          DecoratedListMenu(
            icon: Icons.shopping_cart_outlined,
            textSize: textSize,
            iconSize: iconSize,
            onPress: () {},
            title: 'My Wishlist',
          ),
          DecoratedListMenu(
            icon: Icons.location_on_outlined,
            textSize: textSize,
            iconSize: iconSize,
            onPress: () {},
            title: 'My Address',
          ),
          DecoratedListMenu(
            icon: Icons.logout_outlined,
            textSize: textSize,
            iconSize: iconSize,
            onPress: () {
              _userRepository.signOut(context);
            },
            title: 'Sign Out',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
