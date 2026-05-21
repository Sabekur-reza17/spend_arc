import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseHookConsumerWidget<State, VM extends Notifier<State>>
    extends HookConsumerWidget {
  const BaseHookConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mProvider = provider();
    final vm = ref.read(mProvider.notifier);
    final state = ref.watch(mProvider);
    return buildChild(context, vm, state, ref);
  }

  Widget buildChild(BuildContext context, VM vm, State state, WidgetRef ref);

  NotifierProvider<VM, State> provider();
}
