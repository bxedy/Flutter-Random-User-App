import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_random_user/views/random_users_view/random_users_list_view.dart';
import 'package:flutter_random_user/controllers/random_users_store.dart/random_users_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RandomUsersStore>(
          create: (_) => RandomUsersStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const RandomUsersListView(),
      ),
    );
  }
}
