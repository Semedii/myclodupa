part of 'menu_cubit.dart';

sealed class MenuState {}

final class MenuInitial extends MenuState{}

final class MenuIdle extends MenuState {
  final List<MenuItem> menuList;

  MenuIdle({required this.menuList});
}

final class MenuLoading extends MenuState{}
