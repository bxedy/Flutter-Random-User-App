import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_random_user/controllers/result_store.dart/result_store.dart';
import 'package:flutter_random_user/utils/loading_status.dart';
import 'package:flutter_random_user/views/home_view/components/custom_text_field.dart';
import 'package:flutter_random_user/views/home_view/components/gender_selection.dart';
import 'package:flutter_random_user/views/result_details_view/result_details_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    final resultController = Provider.of<ResultStore>(context, listen: false);

    resultController.getResult(isRefresh: false);

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        resultController.getResult(isRefresh: true);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resultController = Provider.of<ResultStore>(context, listen: false);

    return Scaffold(backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const CustomTextField(title: 'Random Users',),
            GenderSelection(),
            Observer(
                builder: (context) =>
                    resultController.loadingStatus == LoadingStatus.loaded
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: resultController.filteredResultsList.length + 1,
                            itemBuilder: (context, index) {
                              if (index < resultController.filteredResultsList.length) {
                                final item =
                                    resultController.filteredResultsList[index];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResultDetailsView(
                                          resultItem: item,
                                        ),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    item.name!.first!,
                                  ),
                                  leading: ClipOval(
                                    child: Image.network(
                                      item.picture!.thumbnail!,
                                    ),
                                  ),
                                );
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.0),
                                  child: LinearProgressIndicator(),
                                );
                              }
                            },
                          )
                        : const LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
