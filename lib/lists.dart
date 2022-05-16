import 'dart:collection';
import 'package:flutter/widgets.dart';

class SubsList {
  String name;
  double fee;
  // String url;
  // String period;
  // DateTime date;

  SubsList({
    required this.name,
    required this.fee,
    // required this.url,
    // required this.period,
    // required this.date,
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
