import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';
import '../data/local/app_database.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  final database = AppDatabase();
  getIt.registerSingleton<AppDatabase>(database);
  getIt.init();
}
