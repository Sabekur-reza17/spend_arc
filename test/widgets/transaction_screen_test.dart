import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spend_arc/core/app_router.dart';
import 'package:spend_arc/domain/repositories/transaction_repository.dart';
import 'package:spend_arc/features/stats/stats_view_model.dart';
import 'package:spend_arc/features/transactions/add/add_transaction_screen.dart';
import 'package:spend_arc/features/transactions/transaction_screen.dart';
import 'package:spend_arc/features/transactions/transaction_view_model.dart';
import 'package:spend_arc/utilities/resource.dart';

import '../helpers/l10n_test_helper.dart';
import '../viewmodels/transaction_view_model_test.dart';

void main() {
  late MockTransactionRepository repository;
  late AppRouter appRouter;

  setUp(() async {
    await GetIt.instance.reset();
    repository = MockTransactionRepository();
    repository.pushMockData([]);

    GetIt.instance.registerSingleton<TransactionRepository>(repository);
    GetIt.instance.registerFactory<TransactionViewModel>(
      () => TransactionViewModel(GetIt.instance()),
    );
    GetIt.instance.registerFactory<StatsViewModel>(
      () => StatsViewModel(GetIt.instance()),
    );
    appRouter = AppRouter();
    GetIt.instance.registerSingleton<AppRouter>(appRouter);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  testWidgets('Widget Test 1: TransactionScreen renders FAB and Appbar', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: wrapWithL10n(const TransactionScreen()),
      ),
    );
    await tester.pump();

    expect(find.text('SpendArc'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Widget Test 2: FAB navigates to AddTransactionScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: wrapRouterWithL10n(appRouter.config()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(AddTransactionScreen), findsOneWidget);
    expect(find.text('Add Expense'), findsOneWidget);
  });
}
