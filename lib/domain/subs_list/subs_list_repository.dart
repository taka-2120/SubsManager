import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';

final subsListRepositoryProvider =
    Provider<SubsListRepository>((ref) => SubsListRepository(ref: ref));

class SubsListRepository {
  SubsListRepository({required Ref ref}) : _ref = ref;

  final Ref _ref;
  final _db = FirebaseFirestore.instance;

  Future<void> addSub({required SubItem item}) async {
    try {
      await _db
          .doc(SubItem.docPath(item.id))
          .withConverter(
            fromFirestore: (doc, _) => SubItem.fromJson(doc.data()!),
            toFirestore: (SubItem object, _) => object.toJson(),
          )
          .set(item, SetOptions(merge: true));
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }
  }

  Future<List<SubItem>> getSubsList() async {
    final doc = _db.collection('subs_list');
    final snapshots = await doc.get();

    if (snapshots.docs.isEmpty) {
      return [];
    }
    final list = <SubItem>[];
    for (var i = 0; i < snapshots.docs.length; i++) {
      list.add(SubItem.fromJson(snapshots.docs[i].data()));
    }
    return list;
  }

  Future<void> deleteSub({required SubItem item}) async {
    try {
      await _db.doc(SubItem.docPath(item.id)).delete();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }
  }

  Future<void> updateSub({required SubItem item}) async {
    try {
      await _db
          .doc(SubItem.docPath(item.id))
          .withConverter(
            fromFirestore: (doc, _) => SubItem.fromJson(doc.data()!),
            toFirestore: (SubItem object, _) => object.toJson(),
          )
          .set(item, SetOptions(merge: true));
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return;
    }
  }
}
