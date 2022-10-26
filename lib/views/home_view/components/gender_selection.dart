import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_random_user/controllers/result_store.dart/result_store.dart';
import 'package:provider/provider.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

int selectedIndex = 0;

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    final resultController = Provider.of<ResultStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(children: [
        GenderContainer(
          label: 'Homens',
          onPressed: () {
            if (selectedIndex == 2) {
              selectedIndex = 0;
            }
            resultController.filterByGender('male');
            selectedIndex = 1;
            setState(() {});
          },
          icon: Icons.male,
          index: 1,
        ),
        GenderContainer(
          label: 'Mulheres',
          onPressed: () {
            if (selectedIndex == 2) {
              selectedIndex = 0;
            }
            resultController.filterByGender('female');

            selectedIndex = 2;
            setState(() {});
          },
          icon: Icons.female,
          index: 2,
        )
      ]),
    );
  }
}

class GenderContainer extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final int index;
  const GenderContainer({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: isSelected ? 0 : 3,
          primary: isSelected ? Colors.blueGrey.shade800 : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.white : Colors.blueGrey.shade800),
            ),
            Icon(icon,
                color: isSelected ? Colors.white : Colors.blueGrey.shade800)
          ],
        ),
      ),
    );
  }
}
