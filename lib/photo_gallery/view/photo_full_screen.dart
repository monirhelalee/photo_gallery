import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';

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
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/set_wallpaper.png",
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.share),
                    Text(
                      "Share",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  BotToast.showLoading();
                  try {
                    var imageId =
                        await ImageDownloader.downloadImage(widget.imageUrl);
                    if (imageId == null) {
                      BotToast.closeAllLoading();
                      BotToast.showText(
                          text: "Something wrong, Please try again!");
                      return;
                    }
                    var fileName = await ImageDownloader.findName(imageId);
                    var path = await ImageDownloader.findPath(imageId);
                    var size = await ImageDownloader.findByteSize(imageId);
                    var mimeType = await ImageDownloader.findMimeType(imageId);
                    BotToast.closeAllLoading();
                    BotToast.showText(
                        text:
                            "Download Successful!\nImage find in download folder");
                  } on PlatformException catch (error) {
                    BotToast.closeAllLoading();
                    BotToast.showText(
                        text: "Something wrong, Please try again!");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.download),
                    Text(
                      "Download",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
