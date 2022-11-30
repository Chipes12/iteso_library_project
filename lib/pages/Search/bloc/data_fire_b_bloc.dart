import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'data_fire_b_event.dart';
part 'data_fire_b_state.dart';

class DataFireBBloc extends Bloc<DataFireBEvent, DataFireBState> {
  dynamic results;

  DataFireBBloc() : super(DataFireBInitial()) {
    on<SearchEvent>(_getData);
  }

  FutureOr<void> _getData(SearchEvent event, Emitter emit) async {
    emit(DataSearchingState());
    results = await searchOnFireBase(event.strToSearch);
    if (results != null) {
      //print("QUIEN SOY " + results["title"]);
      emit(DataFoundState());
    } else {
      emit(DataNotFoundState());
    }
  }

  dynamic searchOnFireBase(String toSearch) async {
    dynamic result = null;
    await FirebaseFirestore.instance
        .collection('book')
        .where('title', isEqualTo: toSearch)
        .get()
        .then((value) => result = value.docs[0].data());
    print(result);
    return result;
  }
}
