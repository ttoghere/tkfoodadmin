import 'package:flutter/material.dart';
import 'package:tkfoodadmin/screens/menu/menu_screen.dart';
import 'package:tkfoodadmin/screens/settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      // 'Dashboard': {
      //   'routeName': '/dash',
      //   'icon': const Icon(Icons.dashboard),
      // },
      "Settings": {
        "routeName": SettingsScreen.routeName,
        "icon": const Icon(Icons.settings)
      },
      'Menu': {
        'routeName': MenuScreen.routeName,
        'icon': const Icon(Icons.menu_book),
      },

      'Logout': {
        'routeName': '/logout',
        'icon': const Icon(Icons.logout_outlined),
      },
    };

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Your Restaurant Name',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value['icon'],
              title: Text(screen.key),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  screen.value['routeName'],
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
