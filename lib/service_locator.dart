import 'package:get_it/get_it.dart';
import 'package:mycloudpa/cubits/cart/cart_cubit.dart';

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  serviceLocator.registerSingleton<CartCubit>(CartCubit());
}
