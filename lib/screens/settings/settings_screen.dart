import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tkfoodadmin/blocs/settings/settings_bloc.dart';
import 'package:tkfoodadmin/widgets/custom_layout.dart';
import 'package:tkfoodadmin/widgets/custom_textfield.dart';
import 'package:tkfoodadmin/widgets/opening_hours.dart';
import '/config/responsive.dart';
import '/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "/settings";
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Settings',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildBasicInformation(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildRestaurantDescription(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInformation(context),
                    const SizedBox(height: 10),
                    _buildRestaurantDescription(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Opening Hours',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          _buildOpeningHours(),
        ],
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildOpeningHours() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurant.openingHours!.length,
            itemBuilder: (BuildContext context, int index) {
              var openingHours = state.restaurant.openingHours![index];
              return OpeningHoursSettings(
                openingHours: openingHours,
                onCheckboxChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpeningHours(
                          openingHours: openingHours.copyWith(
                              isOpen: !openingHours.isOpen),
                        ),
                      );
                },
                onSliderChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpeningHours(
                          openingHours: openingHours.copyWith(
                            openAt: value.start,
                            closeAt: value.end,
                          ),
                        ),
                      );
                },
              );
            },
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildImage() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const SizedBox();
        }
        if (state is SettingsLoaded) {
          return (state.restaurant.imageUrl != null)
              ? Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.restaurant.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox();
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }

  Container _buildRestaurantDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant Description',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 5,
                  title: 'Description',
                  hasTitle: false,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  onFocusChanged: (p0) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                              restaurant: state.restaurant,
                              isUpdateCompleted: true),
                        );
                  },
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(description: value),
                          ),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  Container _buildBasicInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Name',
                  hasTitle: true,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  onFocusChanged: (p0) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                              restaurant: state.restaurant,
                              isUpdateCompleted: true),
                        );
                  },
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(name: value),
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Image',
                  hasTitle: true,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(imageUrl: value),
                          ),
                        );
                  },
                  onFocusChanged: (p0) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                              restaurant: state.restaurant,
                              isUpdateCompleted: true),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Tag',
                  hasTitle: true,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(', ')
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant
                                .copyWith(tags: value.split(', ')),
                          ),
                        );
                  },
                  onFocusChanged: (p0) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                              restaurant: state.restaurant,
                              isUpdateCompleted: true),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
