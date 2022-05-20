import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:subsmanager/pages/subs/subs_add.dart';
import 'package:subsmanager/pages/subs/subs_list.dart';
import '../../common.dart';
import '../../globals.dart' as globals;
import '../../functions.dart' as func;
import '../settings/notifications.dart';

class Subs extends StatelessWidget {
  const Subs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SubsModel()),
    ], child: const SubsPage());
  }
}

class SubsPage extends StatefulWidget {
  const SubsPage({Key? key}) : super(key: key);

  @override
  State<SubsPage> createState() => _SubsState();
}

class _SubsState extends State<SubsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubsModel>(builder: (context, subsList, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              pageTitle(context, globals.subs, false, true),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return _subsItem(
                        subsList.subsList[index].name,
                        subsList.subsList[index].fee,
                        subsList.subsList[index].period,
                        subsList.subsList[index].date,
                        context);
                  },
                  itemCount: subsList.subsList.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBarModalBottomSheet(
              context: context,
              builder: (context) => const SubsAdd(),
              bounce: true,
              expand: true,
            );
            subsList.add(SubsList(
                name: "Apple One",
                fee: 1100.toDouble(),
                period: 0,
                date: DateTime.now()));
          },
          foregroundColor: globals.customSwatch,
          backgroundColor: Colors.white,
          tooltip: 'Add a Subscription',
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}

Widget _subsItem(
    String name, double fee, int period, DateTime date, BuildContext context) {
  func.Functions _func = func.Functions();

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    padding: const EdgeInsets.all(18),
    height: 130,
    decoration: BoxDecoration(
        border: Border.all(color: globals.borderColor, width: 1),
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_func.roundedFeeToString(fee, context)} / ${_func.periodToString(period)}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              "Next: ${_func.dateToString(date, context)}",
              style: const TextStyle(
                  color: globals.borderColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ],
        ),
      ],
    ),
  );
}
