// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

Widget header(String title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 194, 194, 194),
          onPrimary: Colors.black,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
      ),
      const Text("Add",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 194, 194, 194),
          onPrimary: Colors.black,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    ],
  );
}

Widget textFieldSet(String title, TextEditingController controller) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 216, 216),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    ),
  ]);
}

Widget settingsItem() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.notifications),
          Text(""),
          Icon(Icons.arrow_right)
        ]),
  );
}
