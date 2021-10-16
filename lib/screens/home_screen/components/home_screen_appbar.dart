import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Delivering to : ",
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 0.5, fontSize: 16),
                  ),
                ),
                Text(
                  "Belapur Village, Sec-20 CBD Belapur Navi Mumbai",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
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
