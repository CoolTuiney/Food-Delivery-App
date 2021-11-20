import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/cart_model.dart';
import 'package:food_delivery_app/constants/constants.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';

import 'package:provider/provider.dart';
import '../custom_background.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final foodCart = Provider.of<List<Cart>>(context);
    super.build(context);
    return Column(
      children: [
        CustomBackground(
          size: size,
          widget: const Center(
            child: Text(
              'Your Cart',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: foodCart.length,
              itemBuilder: (context, index) {
                if (foodCart.isNotEmpty) {
                  return CartBuilder(food: foodCart[index]);
                } else {
                  return const Center(
                    child: Text('Cart is Empty'),
                  );
                }
              }),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: must_be_immutable
class CartBuilder extends StatelessWidget {
  Cart food;
  CartBuilder({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discountPrice = food.price! - (food.price! * (food.discount! / 100));
    final _cartRepository = CartRepository();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IntrinsicHeight(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child:
                          Image.network('${food.photoUrl}', fit: BoxFit.fill)),
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
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
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
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black87, width: 2)),
                          child: Center(
                            child: Text(
                              food.quantity.toString(),
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _cartRepository.decrementCart(
                                  food.name!, food.quantity!);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              size: 30,
                            )),
                        IconButton(
                          onPressed: () {
                            _cartRepository.incrementCart(
                                food.name!, food.quantity!);
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () =>
                                _cartRepository.removeItemFromCart(food.name!),
                            child: Tooltip(
                              decoration: BoxDecoration(color: ConstantColor.orange,borderRadius: BorderRadius.circular(10)),
                              triggerMode: TooltipTriggerMode.longPress,
                              message: 'Remove Cart',
                              child: Icon(
                                Icons.close,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          )),
                      Text(
                        '₹ $discountPrice',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          height: 40,
        )
      ],
    );
  }
}
