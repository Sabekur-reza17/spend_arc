import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
@singleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TransactionRoute.page, initial: true),
    AutoRoute(page: AddTransactionRoute.page),
  ];
}
