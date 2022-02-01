import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery/photo_gallery/view/widget/photo_list_card.dart';
import 'package:photo_gallery/photo_gallery/view_model/photo_list_view_model.dart';
import 'package:photo_gallery/resource/theme.dart';
import 'package:provider/provider.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  @override
  void initState() {
    var photoListVm = PhotoListViewModel.read(context);
    Future.delayed(Duration.zero, () async {
      await photoListVm.getPhotoListData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var photoListVm = PhotoListViewModel.watch(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .3,
        title: Text(
          "Images",
          style: GoogleFonts.poppins(color: AppTheme.primaryFontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
            itemCount: photoListVm.photoListData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              return PhotoCardWidget(
                photoData: photoListVm.photoListData[index],
              );
            }),
      ),
    );
  }
}
