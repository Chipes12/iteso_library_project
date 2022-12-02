import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<dynamic> _mybooks = [];
  List<dynamic> get getBooksList => _mybooks;

  List<dynamic> _myMovies = [];
  List<dynamic> get getMoviesList => _myMovies;

  Future<void> myFavs() async {
    await db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => {
              _myMovies = [],
              _mybooks = [],
              value.data()!["favorites"].forEach((title) async {
                await db
                    .collection("book")
                    .where("title", isEqualTo: title)
                    .get()
                    .then((value) => {
                          value.docs.forEach((element) {
                            _mybooks.add(element.data());
                          })
                        });
                await db
                    .collection("movie")
                    .where("title", isEqualTo: title)
                    .get()
                    .then((value) => {
                          value.docs.forEach((element) {
                            _myMovies.add(element.data());
                          })
                        });
              })
            });
  }
}
