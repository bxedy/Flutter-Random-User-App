import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/views/result_details_view/components/info_card.dart';

class UserDetailsView extends StatefulWidget {
  final Result resultItem;

  const UserDetailsView({
    Key? key,
    required this.resultItem,
  }) : super(key: key);

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        height: 150,
                        width: 150,
                        imageUrl: widget.resultItem.picture!.thumbnail!,
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.resultItem.name!.first!} ${widget.resultItem.name!.last!}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.blueGrey.shade800,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            widget.resultItem.gender == 'male'
                                ? Icons.male
                                : Icons.female,
                            color: Colors.blueGrey.shade800,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: personalInfoCard(),
                      ),
                      locationInfoCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personalInfoCard() {
    return CustomInfoContainer(
      title: 'Informações pessoais',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Primeiro nome:'),
            Text(widget.resultItem.name!.first!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sobrenome:'),
            Text(widget.resultItem.name!.last!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Idade:'),
            Text(widget.resultItem.dob!.age!.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Telefone:'),
            Text(widget.resultItem.phone.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Celular:'),
            Text(widget.resultItem.cell.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Gênero:'),
            Text(widget.resultItem.gender.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Email:'),
            Text(widget.resultItem.email.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Nome de usuário:'),
            Text(widget.resultItem.login!.username!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Senha:'),
            Text(widget.resultItem.login!.password!),
          ],
        ),
      ],
    );
  }

  Widget locationInfoCard() {
    return CustomInfoContainer(
      title: 'Localização',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Rua:'),
            Text(widget.resultItem.location!.street!.name!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Número:'),
            Text(widget.resultItem.location!.street!.number!.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Cudade:'),
            Text(widget.resultItem.location!.city!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Estado:'),
            Text(widget.resultItem.location!.state!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('País:'),
            Text(widget.resultItem.location!.country!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Fuso horário:'),
            Text(widget.resultItem.location!.timezone!.offset.toString()),
          ],
        ),
      ],
    );
  }
}
