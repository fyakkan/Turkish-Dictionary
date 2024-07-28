import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:turkish_dictionary/models/kelimeler_response.dart';

class DictionaryService {
  Future<List<String>> searchWord(String word) async {
    print('searchWord: $word');
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<String> anlamlar = [];
      if (result[0] != null) {
        KelimelerResponse kelimelerResponse =
            KelimelerResponse.fromJson(result[0]);

        for (AnlamlarList anlam in kelimelerResponse.anlamlarList!) {
          anlamlar.add(anlam.anlam!);
        }
        print(anlamlar);
        return anlamlar;
      }
      print('Anlamlar is null!');
    }
    throw Exception('Failed to load data');
  }
}
