import 'package:flutter/material.dart';
import 'package:turkish_dictionary/services/dictionary_service.dart';
import 'package:turkish_dictionary/viewmodels/meaining_view_model.dart';

enum Status { initial, loading, notfound, success }

class MeaningListViewModel extends ChangeNotifier {
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.initial;

  Future<void> getMeanings(String word) async {
    status = Status.loading;
    notifyListeners();
    List<String> meanings = await DictionaryService().searchWord(word);
    meaningViewModel = MeaningViewModel(word, meanings);
    status = meanings.isEmpty ? Status.notfound : Status.success;
    notifyListeners();
  }
}
