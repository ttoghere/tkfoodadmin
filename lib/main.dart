import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfoodadmin/blocs/settings/settings_bloc.dart';
import 'package:tkfoodadmin/repositories/restaurant/restaurant_repository.dart';
import 'package:tkfoodadmin/screens/settings/settings_screen.dart';
import '/blocs/blocs.dart';
import '/config/theme.dart';

import 'models/models.dart';
import 'screens/screens.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

const restaurantID = "MxsHeQvTYBNBeAYwMvvi";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RestaurantRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc()
              ..add(
                LoadCategories(categories: Category.categories),
              ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              restaurantRepository: context.read<RestaurantRepository>(),
              categoryBloc: BlocProvider.of<CategoryBloc>(context),
            )..add(
                LoadProducts(products: Product.products),
              ),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(
                restaurantRepository: context.read<RestaurantRepository>())
              ..add(
                const LoadSettings(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          initialRoute: MenuScreen.routeName,
          routes: {
            MenuScreen.routeName: (context) => const MenuScreen(),
            SettingsScreen.routeName: (context) => const SettingsScreen()
            // '/dash': (context) => const DashboardScreen(),
          },
        ),
      ),
    );
  }
}
