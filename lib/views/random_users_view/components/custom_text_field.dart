import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_random_user/controllers/random_users_store.dart/random_users_store.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

TextEditingController searchController = TextEditingController();

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final randomUsersStore = Provider.of<RandomUsersStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              controller: searchController,
              onChanged: (val) {
                randomUsersStore.filterByName(val);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 14),
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
