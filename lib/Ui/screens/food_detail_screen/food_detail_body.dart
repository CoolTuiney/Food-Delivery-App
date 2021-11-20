import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/food_model.dart';
import 'package:food_delivery_app/Ui/widgets/button.dart';
import 'package:food_delivery_app/provider/quantity_provider.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/repository/wishlist_repo.dart';
import 'package:provider/provider.dart';
import '../../../constants/constants.dart';
import '../../widgets/custom_background.dart';

class FoodDetailBody extends StatefulWidget {
  final Food food;
  final String tag;
  const FoodDetailBody({
    Key? key,
    required this.food,
    required this.tag,
  }) : super(key: key);

  @override
  State<FoodDetailBody> createState() => _FoodDetailBodyState();
}

class _FoodDetailBodyState extends State<FoodDetailBody>
    with SingleTickerProviderStateMixin {
  final WishlistRepository _wishlistRepository = WishlistRepository();
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late bool isFav;
  @override
  void initState() {
    _wishlistRepository.checkItemInWishlist(widget.food.name!).then((value) {
      isFav = value;
      (isFav) ? _controller.forward(from: 1) : _controller.reverse();
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 40, end: 60), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 60, end: 40), weight: 50),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final discountPrice = widget.food.price! -
        (widget.food.price! * (widget.food.discount! / 100));
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
                    widget.food.name!,
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
                      tag: widget.tag,
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
                            widget.food.photoUrl!,
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
                      widget.food.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.food.discount}% off',
                          style: const TextStyle(
                              color: ConstantColor.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ ${widget.food.price}.00',
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
                  widget.food.discription!,
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
                      Expanded(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, child) {
                            return IconButton(
                                onPressed: () {
                                  if (isFav) {
                                    _controller.reverse();
                                    _wishlistRepository.removeItemFromWishList(
                                        widget.food.name!);
                                  } else {
                                    _controller.forward();

                                    _wishlistRepository
                                        .addItemToWishList(widget.food.name!);
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: _sizeAnimation.value,
                                  color: _colorAnimation.value,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                    size: size,
                    text: 'Add To Cart',
                    onPress: () {
                      debugPrint(isFav.toString());
                      _cartRepository.addItemToCart(widget.food.name!,
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
