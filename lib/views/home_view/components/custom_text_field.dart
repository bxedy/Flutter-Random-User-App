import 'package:flutter/material.dart';
import 'package:flutter_random_user/controllers/result_store.dart/result_store.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final resultController = Provider.of<ResultStore>(context, listen: false);

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
              onChanged: (val) {
                resultController.filterByName(val);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.filter_list,
                    size: 24,
                    color: Colors.blueGrey.shade800,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.zero,
                    elevation: 3,
                    shape: CircleBorder(),
                    minimumSize: Size(34, 34),
                    maximumSize: Size(34, 34),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: 60, minHeight: 34, maxWidth: 60, minWidth: 34),
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
