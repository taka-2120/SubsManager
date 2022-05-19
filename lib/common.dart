// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

Widget header(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          color: const Color.fromARGB(255, 224, 224, 224),
          textColor: Colors.black,
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        const Text("Add",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        MaterialButton(
          color: const Color.fromARGB(255, 224, 224, 224),
          textColor: Colors.black,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.check),
        ),
      ],
    ),
  );
}

Widget textFieldSet(String title, bool num, TextEditingController controller) {
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
        color: const Color.fromARGB(255, 232, 232, 232),
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

Widget settingsItem(Icon icon, String title, bool navigatable) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: icon,
            ),
            TextSpan(
              text: title,
            ),
          ],
        ),
      ),
      const Icon(Icons.arrow_right)
    ]),
  );
}
