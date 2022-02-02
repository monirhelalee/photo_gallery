import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_gallery/photo_gallery/model/photo_list_model.dart';
import 'package:photo_gallery/resource/theme.dart';
import 'package:photo_gallery/resource/urls.dart';

class PhotoCardWidget extends StatelessWidget {
  final PhotoListModel? photoData;
  const PhotoCardWidget({Key? key, this.photoData}) : super(key: key);

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
              imageUrl: "${Urls.baseUrl}/id/${photoData?.id}/360/360",
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
