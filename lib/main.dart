import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen.dart';
import 'package:photo_gallery/resource/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      themeMode: ThemeMode.light,
      theme: AppTheme.primaryTheme,
      debugShowCheckedModeBanner: false,
      home: const PhotoListScreen(),
    );
  }
}
