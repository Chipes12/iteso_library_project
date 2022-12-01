import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'data_fire_b_event.dart';
part 'data_fire_b_state.dart';

class DataFireBBloc extends Bloc<DataFireBEvent, DataFireBState> {
  List<dynamic> results = [];

  DataFireBBloc() : super(DataFireBInitial()) {
    on<SearchEvent>(_getData);
  }

  FutureOr<void> _getData(SearchEvent event, Emitter emit) async {
    emit(DataSearchingState());
    results = await searchOnFireBase(event.strToSearch);
    if (results.length > 0) {
      //print("QUIEN SOY " + results["title"]);
      emit(DataFoundState());
    } else if (results.length == 0) {
      emit(DataNotFoundState());
    }
  }

  dynamic searchOnFireBase(String? toSearch) async {
    List<dynamic> result = [];
    await FirebaseFirestore.instance
        .collection('book')
        .where('searchOptions', arrayContains: toSearch)
        .get()
        .then((value) => {
              if (value.docs.length > 0)
                {
                  value.docs.forEach((element) {
                    result.add(element.data());
                  })
                }
              else
                {result.clear()}
            });

    if (result.length == 0) {
      await FirebaseFirestore.instance
          .collection('movie')
          .where('searchOptions', arrayContains: toSearch)
          .get()
          .then((value) => {
                if (value.docs.length > 0)
                  value.docs.forEach((element) {
                    result.add(element.data());
                  })
                else
                  {result.clear()}
              });
    }
    print(result);
    return result;
  }
}
