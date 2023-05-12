// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfoodadmin/blocs/blocs.dart';

import 'package:tkfoodadmin/models/models.dart';
import 'package:tkfoodadmin/widgets/custom_textfield.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: (index == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Product product = Product(
                      name: "",
                      category: "",
                      description: "",
                      imageUrl: "",
                      price: 0.0,
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 450,
                            width: 500,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "Add a Product",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomDropdownButton(
                                  items: Category.categories
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (p0) {
                                    product = product.copyWith(category: p0);
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Name',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(name: value);
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Price',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(
                                        price: double.parse(value));
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Image URL',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(imageUrl: value);
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 3,
                                  title: 'Description',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product =
                                        product.copyWith(description: value);
                                  },
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ProductBloc>()
                                          .add(AddProduct(product: product));
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Save",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  iconSize: 40,
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Add a Product',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            )
          : Column(
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
