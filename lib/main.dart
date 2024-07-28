import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_dictionary/pages/mean_list_page.dart';
import 'package:turkish_dictionary/viewmodels/meaining_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Turkish Dictionary",
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red
        
      ),
      home: ChangeNotifierProvider(
        create: (context) => MeaningListViewModel(),
        child: const MeanListPage(),
      ),
    );
  }
}
