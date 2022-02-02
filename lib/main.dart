import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen.dart';
import 'package:photo_gallery/photo_gallery/view_model/photo_list_view_model.dart';
import 'package:photo_gallery/resource/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoListViewModel>(
            create: (context) => PhotoListViewModel()),
      ],
      child: MaterialApp(
        title: 'Photo Gallery',
        themeMode: ThemeMode.light,
        theme: AppTheme.primaryTheme,
        debugShowCheckedModeBanner: false,
        home: const PhotoListScreen(),
      ),
    );
  }
}
