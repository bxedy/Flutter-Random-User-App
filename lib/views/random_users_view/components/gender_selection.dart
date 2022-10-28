import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_random_user/utils/gender_enum.dart';
import 'package:flutter_random_user/controllers/random_users_store.dart/random_users_store.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

int selectedIndex = 0;

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    final randomUsersStore = Provider.of<RandomUsersStore>(context, listen: false);

    return Row(children: [
      GenderButton(
        onPressed: () {
          randomUsersStore.switchGender(context, Gender.male);
        },
        gender: Gender.male,
      ),
      GenderButton(
        onPressed: () {
          randomUsersStore.switchGender(context, Gender.female);
        },
        gender: Gender.female,
      )
    ]);
  }
}

class GenderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Gender gender;
  const GenderButton({
    Key? key,
    required this.onPressed,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomUsersStore = Provider.of<RandomUsersStore>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Observer(
          builder: (context) {
            final isSelected = gender == randomUsersStore.selectedGender;

            return ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: isSelected ? 0 : 3,
                primary: isSelected ? Colors.blueGrey.shade800 : Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    gender == Gender.female ? 'Mulheres' : 'Homens',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? Colors.white
                            : Colors.blueGrey.shade800),
                  ),
                  Icon(gender == Gender.female ? Icons.female : Icons.male,
                      color:
                          isSelected ? Colors.white : Colors.blueGrey.shade800)
                ],
              ),
            );
          },
        ));
  }
}
