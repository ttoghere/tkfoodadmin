import 'package:flutter/material.dart';
import 'package:tkfoodadmin/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        category.imageUrl,
        height: 25,
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}
