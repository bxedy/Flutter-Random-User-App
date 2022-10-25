import 'package:flutter/material.dart';
import 'package:flutter_random_user/controllers/result_store.dart/result_store.dart';
import 'package:flutter_random_user/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ResultStore>(
          create: (_) => ResultStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeView(),
      ),
    );
  }
}
