import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

Widget sheetHeader(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(context, const Icon(Icons.close)),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        circleButton(context, const Icon(Icons.check)),
      ],
    ),
  );
}

Widget pageTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
  );
}

Widget circleButton(BuildContext context, Icon icon) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: CircleAvatar(
      radius: 20,
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      child: icon,
    ),
  );
}

Widget textFieldSet(BuildContext context, String title, bool num,
    TextEditingController controller) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: num ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    ),
    defaultDivider()
  ]);
}

Widget defaultDivider() {
  return const Divider(height: 40, thickness: 1);
}
