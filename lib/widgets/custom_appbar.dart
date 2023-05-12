import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: SvgPicture.asset(
      //   'svgs/logo.svg',
      // ),
      title: Text(
        'Your Restaurant Name',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Colors.white),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
