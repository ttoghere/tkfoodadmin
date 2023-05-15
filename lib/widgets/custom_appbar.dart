import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfoodadmin/blocs/settings/settings_bloc.dart';

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
      title: _firebaseTitle(),
      centerTitle: false,
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _firebaseTitle() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return Text(
            state.restaurant.name!,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          );
        } else {
          return Text(
            'Your Restaurant Name',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
