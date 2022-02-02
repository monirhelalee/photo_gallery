import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery/photo_gallery/model/photo_list_model.dart';
import 'package:photo_gallery/resource/theme.dart';

class PhotoCardWidget extends StatelessWidget {
  final String? authorName;
  final String? imageUrl;
  final PhotoListModel? photoData;
  const PhotoCardWidget(
      {Key? key, this.authorName, this.imageUrl, this.photoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * .47,
          width: MediaQuery.of(context).size.width * .47,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              fit: BoxFit.cover,
              fadeOutDuration: Duration.zero,
              fadeInDuration: Duration.zero,
              placeholder: (context, _) => Image.asset(
                "assets/placeHolder.jpeg",
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
              errorWidget: (context, _, __) => Image.asset(
                "assets/placeHolder.jpeg",
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
              useOldImageOnUrlChange: true,
              placeholderFadeInDuration: Duration.zero,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            photoData?.author ?? "",
            style: GoogleFonts.poppins(
                color: AppTheme.secondaryFontColor,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
