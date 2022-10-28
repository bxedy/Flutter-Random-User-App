import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_random_user/controllers/random_users_store.dart/random_users_store.dart';
import 'package:flutter_random_user/utils/loading_status_enum.dart';
import 'package:flutter_random_user/views/random_users_view/components/custom_text_field.dart';
import 'package:flutter_random_user/views/random_users_view/components/gender_selection.dart';
import 'package:flutter_random_user/views/user_details_view/user_details_view.dart';
import 'package:provider/provider.dart';

class RandomUsersListView extends StatefulWidget {
  const RandomUsersListView({Key? key}) : super(key: key);

  @override
  State<RandomUsersListView> createState() => _RandomUsersListViewState();
}

class _RandomUsersListViewState extends State<RandomUsersListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    final randomUsersStore =
        Provider.of<RandomUsersStore>(context, listen: false);

    randomUsersStore.getData(context, isRefresh: false);

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        randomUsersStore.getData(context, isRefresh: true);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final randomUsersStore =
        Provider.of<RandomUsersStore>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const CustomTextField(
              title: 'Random Users',
            ),
            const GenderSelection(),
            Observer(
              builder: (context) =>
                  randomUsersStore.loadingStatus == LoadingStatus.loaded
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              randomUsersStore.filteredResultsList.length + 1,
                          itemBuilder: (context, index) {
                            if (index <
                                randomUsersStore.filteredResultsList.length) {
                              final item =
                                  randomUsersStore.filteredResultsList[index];
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserDetailsView(
                                        resultItem: item,
                                      ),
                                    ),
                                  );
                                },
                                title: Text(
                                  item.name!.first!,
                                ),
                                leading: ClipOval(
                                  child: CachedNetworkImage(
                                    height: 45,
                                    width: 45,
                                    imageUrl: item.picture!.thumbnail!,
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: Colors.blueGrey.shade800,
                                    ),
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
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: LinearProgressIndicator(),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
