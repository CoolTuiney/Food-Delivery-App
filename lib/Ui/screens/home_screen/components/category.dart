import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.size,
    required this.categories,
  }) : super(key: key);

  final Size size;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.05,
      child: Row(
        children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, int index) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        categories[index],
                        style: const TextStyle(color: Colors.black54),
                      )),
                    ));
                  })),
        ],
      ),
    );
  }
}
