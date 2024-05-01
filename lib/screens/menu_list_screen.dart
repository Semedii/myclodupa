import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/components/menu_item_tile.dart';
import 'package:mycloudpa/cubits/cubit/menu_cubit.dart';
import 'package:mycloudpa/repositories/menu_repository.dart';

class MenuListScreen extends StatelessWidget {
  MenuListScreen({super.key});

  final MenuRepository _menuRepository = MenuRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu List'),
      ),
      body: BlocProvider(
        create: (context) => MenuCubit(_menuRepository)..initPage(),
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) {
            if (state is MenuInitial) {
              BlocProvider.of<MenuCubit>(context).initPage();
            } else {
              if (state is MenuIdle) {
                return ListView.builder(
                  itemCount: state.menuList.length,
                  itemBuilder: (context, index) {
                    final item = state.menuList[index];
                    return MenuItemTile(item: item);
                  },
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
