import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Streams/food_cart.dart';
import '../custom_background.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  final CartBloc _cartBloc = CartBloc();

  @override
  void initState() {
    _cartBloc.eventSink.add(CartAction.fetch);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          child: StreamBuilder(
              stream: _cartBloc.cartStream,
              builder: (context, AsyncSnapshot<List<Food>> snapshot) {
                debugPrint('streambuilder started');
                if (snapshot.hasError) {
                  debugPrint('has error');
                  return Text('${snapshot.error}');
                }
                if (snapshot.hasData) {
                  debugPrint('has data');
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, int index) {
                              debugPrint(snapshot.data![index].name);
                              return CartBuilder(food: snapshot.data![index]);
                            }),
                      ),
                    ],
                  );
                } else {
                  debugPrint('has else');
                  return const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                }
              }),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CartBuilder extends StatelessWidget {
  Food food;
  CartBuilder({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(food.name);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network('${food.photoUrl}')),
              const SizedBox(
                width: 10,
              ),
              Column(
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
                        child: const Center(
                          child: Text(
                            '0',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                          )),
                    ],
                  ),
                ],
              ),
            ],
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
