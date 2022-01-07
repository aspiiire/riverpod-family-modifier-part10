import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

enum TypeOfNumber {
  low,
  medium,
  high,
}

final familyOfgetRandomNumber = StateProvider.family(
  (ref, TypeOfNumber type) {
    final random = Random();
    late int _generatedNumber;

    if (type == TypeOfNumber.low) {
      _generatedNumber = random.nextInt(10);
    } else if (type == TypeOfNumber.medium) {
      _generatedNumber = 10 + random.nextInt(40);
    } else if (type == TypeOfNumber.high) {
      _generatedNumber = 50 + random.nextInt(50);
    }

    return _generatedNumber;
  },
);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int myNumber = ref.watch(familyOfgetRandomNumber(TypeOfNumber.high));

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$myNumber',
            style: const TextStyle(fontSize: 60),
          ),
        ),
      ),
    );
  }
}
