import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_random_user/controllers/result_store.dart/result_store.dart';
import 'package:flutter_random_user/utils/loading_status.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultController = Provider.of<ResultStore>(context, listen: false);

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Observer(
                builder: (context) =>
                    resultController.loadingStatus != LoadingStatus.loading
                        ? ElevatedButton(
                            onPressed: () {
                              resultController.getResult();
                            },
                            child: Text('call api'),
                          )
                        : CircularProgressIndicator()),
          ),
        ));
  }
}
