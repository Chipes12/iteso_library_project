import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages.dart';

class RentProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<dynamic, List<dynamic>> _myRents = {};
  Map<dynamic, List<dynamic>> get getRentsList => _myRents;

  Future<void> rentMaterial(dynamic material) async {
    var dtStart = DateTime.now();
    if (dtStart.hour < 19 && isTodayLabourDay(dtStart.weekday)) {
    } else if (dtStart.hour > 19 && isTomorrowLabourDay(dtStart.weekday)) {
      dtStart = dtStart.add(Duration(days: 1));
    } else {
      dtStart = dtStart.add(Duration(
          days: (DateTime.monday - dtStart.weekday) % DateTime.daysPerWeek));
    }
    var dtEnd = dtStart.add(Duration(days: 14));
    try {
      if (material["pages"] != null) {
        await db
            .collection('book')
            .where('title', isEqualTo: material["title"])
            .get()
            .then((value) async => {
                  if (value.docs[0]["available"] != 0)
                    {
                      await db.collection("book").doc(value.docs[0].id).update(
                          {"available": value.docs[0]["available"] - 1}),
                      await db.collection('rent').add({
                        "id_material": value.docs[0].id,
                        "id_user": _auth.currentUser!.uid,
                        "endDate": DateFormat('yyyy-MM-dd').format(dtEnd),
                        "startDate": DateFormat('yyyy-MM-dd').format(dtStart),
                        "isabook": true
                      }).then((value) async => {
                            db
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "record": FieldValue.arrayUnion([value.id])
                            })
                          })
                    }
                });
      }
    } catch (e) {
      await db
          .collection('movie')
          .where('title', isEqualTo: material["title"])
          .get()
          .then((value) async => {
                if (value.docs[0]["available"] != 0)
                  {
                    await db
                        .collection("movie")
                        .doc(value.docs[0].id)
                        .update({"available": value.docs[0]["available"] - 1}),
                    await db.collection('rent').add({
                      "id_material": value.docs[0].id,
                      "id_user": _auth.currentUser!.uid,
                      "endDate": DateFormat('yyyy-MM-dd').format(dtEnd),
                      "startDate": DateFormat('yyyy-MM-dd').format(dtStart),
                      "isabook": false
                    }).then((value) async => {
                          db
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            "record": FieldValue.arrayUnion([value.id])
                          })
                        })
                  }
              });
    }
  }

  Future<void> getRents() async {
    await db
        .collection('rent')
        .where('id_user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async => {
              value.docs.forEach((element) async {
                await element.data()["isabook"]
                    ? db.collection("book").doc(element["id_material"]).get().then((value) => {
                      if (_myRents[element.data()["endDate"]] == null) {
                        _myRents[element.data()["endDate"]] = [value.data()]
                      } else {
                        _myRents[element.data()["endDate"]]?.add(value.data())
                      }
                    })
                    : db.collection("movie").doc(element["id_material"]).get().then((value) => {
                      if (_myRents[element.data()["endDate"]] == null) {
                         _myRents[element.data()["endDate"]] = [value.data()]
                      } else {
                        _myRents[element.data()["endDate"]]?.add(value.data())
                      }
                    });
              })
            });
  }
}
