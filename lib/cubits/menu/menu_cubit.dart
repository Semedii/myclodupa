import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycloudpa/model/menu_item.dart';
import 'package:mycloudpa/repositories/menu_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository menuRepository;
  MenuCubit(this.menuRepository) : super(MenuInitial());

  initPage() async {
    emit(MenuLoading());
    // added this to mimick the actual server response time
    await Future.delayed(const Duration(seconds: 2));
    List<MenuItem> menuList = await menuRepository.fetchMenu();
    emit(MenuIdle(menuList: menuList));
  }
}
