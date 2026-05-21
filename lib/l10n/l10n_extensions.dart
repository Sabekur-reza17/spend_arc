import '../domain/expense_categories.dart';
import 'app_localizations.dart';
import 'l10n_keys.dart';

extension AppLocalizationsX on AppLocalizations {
  String resolveMessage(String? keyOrMessage) {
    if (keyOrMessage == null || keyOrMessage.isEmpty) return '';
    return switch (keyOrMessage) {
      L10nKeys.errorLoadingTransactions => errorLoadingTransactions,
      L10nKeys.failedToAdd => failedToAdd,
      L10nKeys.failedToDelete => failedToDelete,
      L10nKeys.failedToClear => failedToClear,
      L10nKeys.unknownCategory => unknownCategory,
      _ => keyOrMessage,
    };
  }

  String categoryName(String category) {
    return switch (category) {
      ExpenseCategories.groceries => categoryGroceries,
      ExpenseCategories.food => categoryFood,
      ExpenseCategories.transport => categoryTransport,
      ExpenseCategories.bills => categoryBills,
      ExpenseCategories.entertainment => categoryEntertainment,
      ExpenseCategories.health => categoryHealth,
      ExpenseCategories.shopping => categoryShopping,
      ExpenseCategories.other => categoryOther,
      L10nKeys.unknownCategory => unknownCategory,
      _ => category,
    };
  }
}
