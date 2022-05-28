import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import 'theme.dart';

Widget sheetHeader(String title, BuildContext context, VoidCallback funcLeft,
    VoidCallback funcRight) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(context, const Icon(Icons.close), funcLeft),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        circleButton(context, const Icon(Icons.check), funcRight),
      ],
    ),
  );
}

Widget pageTitle(BuildContext context, String title, bool back,
    bool rightButton, VoidCallback? rightFunc, Icon? rightIcon) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 15, left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        back
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  foregroundColor: customSwatch,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )
            : const SizedBox(width: 20, height: 20),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        rightButton
            ? circleButton(context, rightIcon!, rightFunc!)
            : const SizedBox(width: 20, height: 20),
      ],
    ),
  );
}

Widget circleButton(BuildContext context, Icon icon, VoidCallback func) {
  return GestureDetector(
    onTap: () => func(),
    child: CircleAvatar(
      radius: 16,
      backgroundColor: entryBackground,
      foregroundColor: globals.primaryColor,
      child: icon,
    ),
  );
}

Widget textFieldSet(BuildContext context, String title, bool num,
    TextEditingController controller, bool url) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: entryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: num
            ? TextInputType.number
            : (url ? TextInputType.text : TextInputType.url),
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
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Divider(height: 40, thickness: 1),
  );
}
