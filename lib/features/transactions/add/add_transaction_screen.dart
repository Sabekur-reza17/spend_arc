import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/expense_categories.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/l10n_extensions.dart';
import 'add_transaction_input.dart';

@RoutePage()
class AddTransactionScreen extends HookConsumerWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController();
    final l10n = AppLocalizations.of(context)!;
    final selectedCategory = useState(ExpenseCategories.all.first);
    final amountError = useState<String?>(null);

    void submit() {
      amountError.value = null;
      final amountText = amountController.text.trim();
      final amount = double.tryParse(amountText);
      if (amount == null || amount <= 0) {
        amountError.value = l10n.amountInvalid;
        return;
      }

      context.router.maybePop(
        AddTransactionInput(
          amount: amount,
          category: selectedCategory.value,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addExpenseTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory.value,
              decoration: InputDecoration(labelText: l10n.categoryLabel),
              items: ExpenseCategories.all
                  .map(
                    (key) => DropdownMenuItem(
                      value: key,
                      child: Text(l10n.categoryName(key)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) selectedCategory.value = value;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: l10n.amountLabel,
                errorText: amountError.value,
                prefixText: l10n.amountPrefix,
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (_) => amountError.value = null,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: submit,
              child: Text(l10n.saveButton),
            ),
          ],
        ),
      ),
    );
  }
}
