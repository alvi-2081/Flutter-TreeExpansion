import 'package:flutter/material.dart';
import 'package:test/theme/colors.dart';
import 'package:test/view/tree_expansion_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: getMaterialColor(AppColors.green)),
        useMaterial3: true,
      ),
      home: const TreeExpansionScreen(),
    );
  }
}
