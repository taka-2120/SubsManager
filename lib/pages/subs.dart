import 'package:flutter/material.dart';
import 'package:subsmanager/lists.dart';
import '../globals.dart' as globals;

class Subs extends StatelessWidget {
  const Subs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubsPage();
  }
}

class SubsPage extends StatefulWidget {
  const SubsPage({Key? key}) : super(key: key);

  @override
  State<SubsPage> createState() => _SubsState();
}

class _SubsState extends State<SubsPage> {
  List<SubsList> subsList = [SubsList(name: "Apple One", fee: 1030.toDouble())];

  void _add() { //W
    setState(() {
      subsList.add(SubsList(name: "Apple One", fee: 1030.toDouble()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(globals.subs,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return _subsItem(subsList[index].name,subsList[index].fee);
                  },
                  itemCount: subsList.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Add a Subscriptiom',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _subsItem(String name, double fee) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          fee.toString(), //W
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 104, 104, 104)),
        ),
      ],
    ),
  );
}
