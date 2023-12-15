import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SimpleNewsScreen extends HookConsumerWidget {
  const SimpleNewsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple News'),
      ),
      body: const Center(
        child: Text('Simple News'),
      ),
    );
  }
}
