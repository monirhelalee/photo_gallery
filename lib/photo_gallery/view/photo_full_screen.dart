import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoFullScreen extends StatefulWidget {
  final String imageUrl;
  final String authorName;
  final String id;
  const PhotoFullScreen(
      {Key? key,
      required this.imageUrl,
      required this.authorName,
      required this.id})
      : super(key: key);

  @override
  _PhotoFullScreenState createState() => _PhotoFullScreenState();
}

class _PhotoFullScreenState extends State<PhotoFullScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: .3,
          title: Text(
            widget.authorName,
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Hero(
          tag: "Photo${widget.id}",
          child: InteractiveViewer(
            maxScale: 4,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
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
        ),
      ),
    );
  }
}
