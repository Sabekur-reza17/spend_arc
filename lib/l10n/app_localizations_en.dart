// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SpendArc';

  @override
  String get addExpenseTitle => 'Add Expense';

  @override
  String get categoryLabel => 'Category';

  @override
  String get amountLabel => 'Amount';

  @override
  String get amountPrefix => '\$ ';

  @override
  String get saveButton => 'Save';

  @override
  String get categoryRequired => 'Select a category';

  @override
  String get amountInvalid => 'Enter a valid amount greater than 0';

  @override
  String get errorLoadingTransactions => 'Error loading transactions';

  @override
  String get failedToAdd => 'Failed to add';

  @override
  String get failedToDelete => 'Failed to delete';

  @override
  String get failedToClear => 'Failed to clear data';

  @override
  String get unknownCategory => 'Unknown';

  @override
  String get clearAllData => 'Clear all data';

  @override
  String get clearAllConfirmTitle => 'Clear all transactions?';

  @override
  String get clearAllConfirmMessage =>
      'This will permanently remove all expenses from this device.';

  @override
  String get cancel => 'Cancel';

  @override
  String get clear => 'Clear';

  @override
  String get categoryGroceries => 'Groceries';

  @override
  String get categoryFood => 'Food';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categoryBills => 'Bills';

  @override
  String get categoryEntertainment => 'Entertainment';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categoryOther => 'Other';

  @override
  String amountDisplay(String amount) {
    return '\$$amount';
  }
}
