import 'dart:collection';
import 'package:flutter/widgets.dart';

class SubsList {
  String name;
  double fee;
  int period; //0: Monthly, 1: semi-annually, 2: annually
  DateTime date;
  // String url;

  SubsList({
    required this.name,
    required this.fee,
    required this.period,
    required this.date,
    // required this.url,
  });
}

class SubsModel with ChangeNotifier {
  final List<SubsList> _subsList = [];

  UnmodifiableListView<SubsList> get subsList =>
      UnmodifiableListView(_subsList);

  void add(SubsList item) {
    _subsList.add(item);
    notifyListeners();
  }
}
