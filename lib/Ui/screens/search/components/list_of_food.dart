import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'dart:math';

import 'package:food_delivery_app/Ui/screens/food_detail_screen/food_detail_screen.dart';

class ListOfFood extends StatelessWidget {
  const ListOfFood({
    Key? key,
    required this.context,
    required this.food,
    this.onPress,
    this.hasRomveButton = false,
  }) : super(key: key);

  final BuildContext context;
  final Food food;
  final bool hasRomveButton;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final discountPrice = food.price! - (food.price! * (food.discount! / 100));
    final Random random = Random();
    final tag = food.name! + random.nextInt(1000).toString();
    return Hero(
      tag: tag,
      child: Material(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => FoodDetailScreen(food: food, tag: tag)));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network('${food.photoUrl}',
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${food.name}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.access_time_outlined,
                                  size: 23,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '35-45 mins',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                  indent: 3,
                                  endIndent: 3,
                                  color: Colors.black,
                                ),
                                Icon(
                                  Icons.star_border,
                                  size: 23,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '₹ $discountPrice',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      (hasRomveButton)
                          ? Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed:
                                        (onPress != null) ? onPress : () {},
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.black45,
                                      size: 30,
                                    )),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
