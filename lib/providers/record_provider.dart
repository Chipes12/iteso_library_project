import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<dynamic> _thisMonth = [];
  List<dynamic> get getThisMonthList => _thisMonth;

  List<dynamic> _lastMonth = [];
  List<dynamic> get getLastMonthList => _lastMonth;

  List<dynamic> _thisYear = [];
  List<dynamic> get getThisYearList => _thisYear;

    List<dynamic> _others = [];
  List<dynamic> get getOthers => _others;

  Future<void> loadRecord() async {
  await db.collection("rent").doc("3NwPFHh1LULkI2pqZOzi").get().then((value) => print(value.data()));

    var today = DateFormat('yyyy-MM-dd').format(DateTime.now()).split("-");
    await db
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((user) => {
              _thisYear = [],
              _lastMonth = [],
              _thisMonth = [],
              user.data()!["record"].forEach((record) async {
                List<String> date;
                await db.collection("rent").doc(record).get().then((rent) async => {
                  print(rent.data()),
                  date = rent.data()!["startDate"].toString().split('-'),
                  await db.collection("book").doc(record["id_material"]).get().then((value) => {
                    if(value.exists){
                      if(today[1] == date[1]) _thisMonth.add(value.data())
                      else if (int.parse(today[1]) - 1 == int.parse(date[1]) || (today[1] == '01' && date[1] == '12')){
                        _lastMonth.add(value.data())
                      } else if(today[0] == date[0]){
                        _thisYear.add(value.data())
                      } else{
                        _others.add(value.data())
                      }
                    }
                  }),
                  await db.collection("movie").doc(record["id_material"]).get().then((value) => {
                    if(value.exists){
                      if(today[1] == date[1]) _thisMonth.add(value.data())
                      else if (int.parse(today[1]) - 1 == int.parse(date[1]) || (today[1] == '01' && date[1] == '12')){
                        _lastMonth.add(value.data())
                      } else if(today[0] == date[0]){
                        _thisYear.add(value.data())
                      } else{
                        _others.add(value.data())
                      }
                    }
                  }),
                  });
              })
            });
  }
}
