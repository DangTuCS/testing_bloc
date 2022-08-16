import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'home_page.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

const names = [
  'Foo',
  'Bar',
  'Barz',
];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() {
    return elementAt(math.Random().nextInt(length));
  }
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}
