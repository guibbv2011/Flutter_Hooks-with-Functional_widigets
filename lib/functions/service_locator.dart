import 'package:get_it/get_it.dart';
import 'package:test_hooks/functions/nav_manager.dart';

final getIt = GetIt?.I;

initServiceLocator() {
  getIt?.registerSingleton<NavManager>(NavManager());
}
