// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tkfoodadmin/models/models.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}
