import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:subsmanager/pages/subs/subs_add.dart';
import 'package:subsmanager/pages/subs/subs_list.dart';
import '../../common.dart';
import '../../globals.dart' as globals;
import 'subs_functions.dart' as subs_func;

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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                pageTitle(globals.subs),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _subsItem(
                          subsList.subsList[index].name,
                          subsList.subsList[index].fee,
                          subsList.subsList[index].period,
                          context);
                    },
                    itemCount: subsList.subsList.length,
                  ),
                ),
              ],
            ),
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
          tooltip: 'Add a Subscription',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

Widget _subsItem(String name, double fee, int period, BuildContext context) {
  subs_func.SubsFunctions func = subs_func.SubsFunctions();

  return Container(
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    height: 130,
    decoration: BoxDecoration(
        border: Border.all(color: globals.borderColor, width: 2),
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
            Text(
              "${func.roundedFeeToString(fee, context)}/${func.periodToString(period)}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Next: ",
              style: TextStyle(color: globals.borderColor, fontSize: 18),
            ),
          ],
        ),
      ],
    ),
  );
}
