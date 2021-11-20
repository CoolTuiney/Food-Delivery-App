import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/address_model.dart';
import 'package:food_delivery_app/provider/location_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({
    Key? key,
    required this.size,
    required this.con,
  }) : super(key: key);
  final Size size;
  final BuildContext con;

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  @override
  void initState() {
    widget.con.read<LocationProvider>().getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Address? add = Provider.of<LocationProvider>(context).getAddress;
    String address;

    if (add != null) {
      address =
          '${add.street} ,${add.subLocality!} ,${add.locality} ,${add.subAdministrativeArea} ,${add.state!}';
    } else {
      address = 'Get Location';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Delivering to : ",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 0.5, fontSize: 16),
                  ),
                ),
                (add == null)
                    ? GestureDetector(
                        onTap: () => context
                            .read<LocationProvider>()
                            .getCurrentLocation(),
                        child: Text(
                          address,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      )
                    : Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_location_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
