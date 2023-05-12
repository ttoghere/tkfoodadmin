// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tkfoodadmin/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    product.imageUrl,
                  ),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
    );
  }
}

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  const CustomDropdownButton({
    Key? key,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            "Category",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              items: items
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: onChanged,
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
