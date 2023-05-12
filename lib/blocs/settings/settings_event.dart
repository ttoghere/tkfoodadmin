part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent {
  final Restaurant restaurant;
  const LoadSettings({this.restaurant = const Restaurant()});
  @override
  List<Object> get props => [restaurant];
}

class UpdateSettings extends SettingsEvent {
  final bool isUpdateCompleted;
  final Restaurant restaurant;
  const UpdateSettings(
      {required this.restaurant, this.isUpdateCompleted = false});
  @override
  List<Object> get props => [restaurant, isUpdateCompleted];
}

class UpdateOpeningHours extends SettingsEvent {
  final OpeningHours openingHours;
  const UpdateOpeningHours({required this.openingHours});
  @override
  List<Object> get props => [openingHours];
}
