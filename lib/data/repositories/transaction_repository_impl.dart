import 'dart:async';
import 'package:flutter/foundation.dart' show debugPrint;
import '../../utilities/resource.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';
import '../local/transaction_local_datasource.dart';
import '../models/transaction_dto.dart';

enum ActionType { add, delete }

class PendingAction {
  final ActionType type;
  final Transaction transaction;

  PendingAction(this.type, this.transaction);
}

class TransactionDiff {
  final List<Transaction> added;
  final List<Transaction> removed;
  TransactionDiff(this.added, this.removed);
}

TransactionDiff _calculateDiff(List<Transaction> oldList, List<Transaction> newList) {
  final oldSet = oldList.toSet();
  final newSet = newList.toSet();
  final added = newSet.difference(oldSet).toList();
  final removed = oldSet.difference(newSet).toList();
  return TransactionDiff(added, removed);
}

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionLocalDataSource _localDataSource;
  final List<PendingAction> _writeQueue = [];
  
  final _transactionsController = StreamController<Resource<List<Transaction>>>.broadcast();
  List<Transaction> _currentList = [];

  TransactionRepositoryImpl(this._localDataSource);

  @override
  Stream<Resource<List<Transaction>>> getTransactions() async* {
    yield const Resource.loading();
    try {
      final dtos = await _localDataSource.getTransactions();
      final domainList = _sortNewestFirst(dtos.map((e) => e.toDomain()).toList());
      _currentList = domainList;
      yield Resource.content(domainList);
    } catch (e) {
      yield Resource.error(e.toString());
    }

    yield* _transactionsController.stream;
  }

  @override
  Stream<Resource<void>> addTransaction(Transaction transaction) async* {
    yield const Resource.loading();
    try {
      final dto = TransactionDto.fromDomain(transaction);
      await _localDataSource.addTransaction(dto);
      
      _writeQueue.add(PendingAction(ActionType.add, transaction));
      _fakeSync();

      yield const Resource.content(null);
      await _refreshTransactions();
    } catch (e) {
      yield Resource.error(e.toString());
    }
  }

  @override
  Stream<Resource<void>> deleteTransaction(String id) async* {
    yield const Resource.loading();
    try {
      final dtos = await _localDataSource.getTransactions();
      final dtoToDelete = dtos.firstWhere((e) => e.id == id);
      
      await _localDataSource.deleteTransaction(id);
      
      _writeQueue.add(PendingAction(ActionType.delete, dtoToDelete.toDomain()));
      _fakeSync();

      yield const Resource.content(null);
      await _refreshTransactions();
    } catch (e) {
      yield Resource.error(e.toString());
    }
  }

  @override
  Stream<Resource<void>> clearAll() async* {
    yield const Resource.loading();
    try {
      await _localDataSource.clearAll();
      _writeQueue.clear();
      yield const Resource.content(null);
      _currentList = [];
      _transactionsController.add(const Resource.content([]));
    } catch (e) {
      yield Resource.error(e.toString());
    }
  }

  List<Transaction> _sortNewestFirst(List<Transaction> list) {
    return list..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> _refreshTransactions() async {
    try {
      final dtos = await _localDataSource.getTransactions();
      final newList = _sortNewestFirst(dtos.map((e) => e.toDomain()).toList());
      
      final diff = _calculateDiff(_currentList, newList);
      debugPrint('Diff - Added: ${diff.added.length}, Removed: ${diff.removed.length}');
      
      _currentList = newList;
      _transactionsController.add(Resource.content(newList));
    } catch (e) {
      _transactionsController.add(Resource.error(e.toString()));
    }
  }

  Future<void> _fakeSync() async {
    if (_writeQueue.isEmpty) return;
    await Future.delayed(const Duration(seconds: 2));
    _writeQueue.clear();
  }
}
