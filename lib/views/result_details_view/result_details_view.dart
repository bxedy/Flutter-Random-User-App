import 'package:flutter/material.dart';
import 'package:flutter_random_user/models/result.dart';
import 'package:flutter_random_user/views/result_details_view/components/info_card.dart';

class ResultDetailsView extends StatelessWidget {
  final Result resultItem;

  const ResultDetailsView({
    Key? key,
    required this.resultItem,
  }) : super(key: key);

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
                      child: SizedBox(
                        height: 250,
                        child: Image.network(
                          resultItem.picture!.large!,
                          fit: BoxFit.fitHeight,
                          scale: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${resultItem.name!.first!} ${resultItem.name!.last!}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.blueGrey.shade800,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            resultItem.gender == 'male'
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
            Text('Primeiro nome:'),
            Text(resultItem.name!.first!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sobrenome:'),
            Text(resultItem.name!.last!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Idade:'),
            Text(resultItem.dob!.age!.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Telefone:'),
            Text(resultItem.phone.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Celular:'),
            Text(resultItem.cell.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Gênero:'),
            Text(resultItem.gender.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Email:'),
            Text(resultItem.email.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nome de usuário:'),
            Text(resultItem.login!.username!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Senha:'),
            Text(resultItem.login!.password!),
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
            Text('Rua:'),
            Text(resultItem.location!.street!.name!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Número:'),
            Text(resultItem.location!.street!.number!.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cudade:'),
            Text(resultItem.location!.city!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Estado:'),
            Text(resultItem.location!.state!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('País:'),
            Text(resultItem.location!.country!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Fuso horário:'),
            Text(resultItem.location!.timezone!.offset.toString()),
          ],
        ),
      ],
    );
  }
}
