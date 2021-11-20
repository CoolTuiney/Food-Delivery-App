
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:food_delivery_app/provider/location_provider.dart';
import 'package:provider/provider.dart';
class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final _auth.User? user;

  @override
  Widget build(BuildContext context) {
    final add = Provider.of<LocationProvider>(context).getAddress;
    String address;
    if (add != null) {
      address =
          '${add.street} ,${add.subLocality!} ,${add.locality} ,${add.subAdministrativeArea} ,${add.state!}';
    } else {
      address = 'Get Location';
    }
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 42,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                foregroundImage: NetworkImage(user!.photoURL!),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user!.displayName!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(address,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
