import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycloudpa/model/menu_item.dart';
import 'package:mycloudpa/repositories/menu_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository menuRepository;
  MenuCubit(this.menuRepository) : super(MenuInitial());

  initPage() async {
    List<MenuItem> menuList = await menuRepository.fetchMenu();
    emit(MenuIdle(menuList: menuList));
  }
}
