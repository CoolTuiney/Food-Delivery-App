import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/widgets/button.dart';
import 'package:food_delivery_app/provider/quantity_provider.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:provider/provider.dart';
import '../../../constants/constants.dart';
import '../../widgets/custom_background.dart';

class FoodDetailBody extends StatelessWidget {
  final Food food;
  final String tag;
  const FoodDetailBody({
    Key? key,
    required this.food,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final discountPrice = food.price! - (food.price! * (food.discount! / 100));
    final _quantityProvider =
        Provider.of<QuantityProvider>(context, listen: true);
    final _cartRepository = CartRepository();
    return Stack(
      children: [
        CustomBackground(size: size),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    food.name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Hero(
                      tag: tag,
                      child: Container(
                        height: size.height * 0.40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset.fromDirection(3, 5))
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            food.photoUrl!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Text(
                          '${food.discount}% off',
                          style: const TextStyle(
                              color: ConstantColor.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ ${food.price}.00',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black54,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          Text(
                            '₹ $discountPrice',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                    child: Text(
                  food.discription!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      const Text(
                        'Quantity:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Colors.black87, width: 2)),
                        child: Center(
                            child: Text(
                          '${context.read<QuantityProvider>().getQuantity}',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                      IconButton(
                          onPressed: () {
                            _quantityProvider.decrementQuantity();
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            size: 40,
                          )),
                      IconButton(
                          onPressed: () {
                            _quantityProvider.incrementQuantity();
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 40,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                    size: size,
                    text: 'Add To Cart',
                    onPress: () {
                      _cartRepository.addItemToCart(food.name!,
                          context.read<QuantityProvider>().getQuantity);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: ConstantColor.orange,
                          content: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Item Added to Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                  fontSize: 15),
                            ),
                          )));
                    },
                    leadingWidget: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
