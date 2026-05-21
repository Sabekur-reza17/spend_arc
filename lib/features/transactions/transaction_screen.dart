import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../core/base_hook_consumer_widget.dart';
import '../../core/vm_provider.dart';
import '../../components/arc_meter.dart';
import '../../components/line_chart.dart';
import '../../components/particle_burst.dart';
import '../../features/stats/transaction_stats.dart';
import '../../core/app_router.gr.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_extensions.dart';
import 'add/add_transaction_input.dart';
import 'transaction_state.dart';
import 'transaction_view_model.dart';
import 'transaction_event.dart';

@RoutePage()
class TransactionScreen extends BaseHookConsumerWidget<TransactionState, TransactionViewModel> {
  const TransactionScreen({super.key});

  @override
  NotifierProvider<TransactionViewModel, TransactionState> provider() =>
      VmProvider.transactionVMP;

  @override
  Widget buildChild(
    BuildContext context,
    TransactionViewModel vm,
    TransactionState state,
    WidgetRef ref,
  ) {
    final l10n = AppLocalizations.of(context)!;
    // Keep stats VM subscribed (inter-bloc stream); arc/chart use transaction list for optimistic sync.
    ref.watch(VmProvider.statsVMP);
    final isAdding = useState(false);

    final totalSpent = TransactionStats.totalSpent(state.transactions);
    final chartData = TransactionStats.last7Amounts(state.transactions);
    const maxLimit = 10000.0;

    Future<void> confirmClearAll() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.clearAllConfirmTitle),
          content: Text(l10n.clearAllConfirmMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.clear),
            ),
          ],
        ),
      );
      if (confirmed == true) {
        vm.onEvent(OnClearAllTransactions());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          if (state.transactions.isNotEmpty)
            IconButton(
              onPressed: confirmClearAll,
              tooltip: l10n.clearAllData,
              icon: const Icon(Icons.delete_sweep),
            ),
        ],
      ),
      body: state.isLoading && state.transactions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    ArcMeter(
                      totalSpent: totalSpent,
                      maxLimit: maxLimit,
                    ),
                    const SizedBox(height: 20),
                    if (chartData.isNotEmpty)
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomPaint(
                          painter: LineChartPainter(
                            dataPoints: chartData,
                            lineColor: Colors.blueAccent,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    if (state.error != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          l10n.resolveMessage(state.error),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = state.transactions[index];
                          return Dismissible(
                            key: ValueKey(transaction.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (_) {
                              vm.onEvent(OnDeleteTransaction(id: transaction.id));
                            },
                            child: ListTile(
                              title: Text(l10n.categoryName(transaction.category)),
                              subtitle: Text(transaction.date.toIso8601String()),
                              trailing: Text(
                                l10n.amountDisplay(transaction.amount.toStringAsFixed(2)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: ParticleBurst(
                      trigger: isAdding.value,
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.router.push<AddTransactionInput>(
            const AddTransactionRoute(),
          );
          if (result == null) return;

          isAdding.value = true;
          vm.onEvent(OnAddTransaction(
            amount: result.amount,
            category: result.category,
          ));
          Future.delayed(const Duration(milliseconds: 650), () {
            isAdding.value = false;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
