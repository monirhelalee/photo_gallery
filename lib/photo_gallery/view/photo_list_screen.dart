import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery/photo_gallery/view/photo_full_screen.dart';
import 'package:photo_gallery/photo_gallery/view/widget/photo_list_card.dart';
import 'package:photo_gallery/photo_gallery/view_model/photo_list_view_model.dart';
import 'package:photo_gallery/resource/string_resource.dart';
import 'package:photo_gallery/resource/theme.dart';
import 'package:provider/provider.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    var photoListVm = PhotoListViewModel.read(context);
    Future.delayed(Duration.zero, () async {
      await photoListVm.getPhotoListData();
    });
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        photoListVm.getMorePhotoListData();
      }
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
          StringResources.photosText,
          style: GoogleFonts.poppins(color: AppTheme.primaryFontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GridView.builder(
                controller: _scrollController,
                itemCount: photoListVm.photoListData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoFullScreen(
                                    imageUrl: photoListVm
                                            .photoListData[index].downloadUrl ??
                                        "",
                                    authorName: photoListVm
                                            .photoListData[index].author ??
                                        "",
                                    id: photoListVm.photoListData[index].id ??
                                        "",
                                  )));
                    },
                    child: Hero(
                      tag: "Photo${photoListVm.photoListData[index].id}",
                      child: PhotoCardWidget(
                        photoData: photoListVm.photoListData[index],
                      ),
                    ),
                  );
                }),
            photoListVm.isMoreLoading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
