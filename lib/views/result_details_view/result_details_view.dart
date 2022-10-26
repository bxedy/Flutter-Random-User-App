import 'package:flutter/material.dart';
import 'package:flutter_random_user/models/result.dart';

class ResultDetailsView extends StatelessWidget {
  final Result resultItem;

  const ResultDetailsView({
    Key? key,
    required this.resultItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipOval(
                child: SizedBox(
                  child: Image.network(
                    resultItem.picture!.large!,
                    fit: BoxFit.fitHeight,
                    scale: 0.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${resultItem.name!.first!} ${resultItem.name!.last!}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
