import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_gallery/resource/string_resource.dart';
import 'package:photo_gallery/utils/download_helper.dart';
import 'package:photo_gallery/utils/share_helper.dart';
import 'package:photo_gallery/utils/wallpaper_set_halper.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

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
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Material(
                          type: MaterialType.transparency,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.only(top: 20, left: 30),
                              height: 210,
                              width: MediaQuery.of(context).size.width * .9,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Set Wallpaper",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      WallPaperSetHelper().setWallpaper(
                                          location: WallpaperManagerFlutter
                                              .HOME_SCREEN,
                                          url: widget.imageUrl);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.home_filled),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          StringResources.homeScreenText,
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      WallPaperSetHelper().setWallpaper(
                                          location: WallpaperManagerFlutter
                                              .LOCK_SCREEN,
                                          url: widget.imageUrl);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.lock),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          StringResources.lockScreenText,
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      WallPaperSetHelper().setWallpaper(
                                          location: WallpaperManagerFlutter
                                              .BOTH_SCREENS,
                                          url: widget.imageUrl);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.phone_android),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          StringResources.homeAndLockScreenText,
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/set_wallpaper.png",
                      height: 18,
                      width: 18,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  ShareHelper()
                      .share(url: widget.imageUrl, title: widget.authorName);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.share,
                      size: 20,
                    ),
                    Text(
                      "Share",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  DownloadHelper().downloadImage(url: widget.imageUrl);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download,
                      size: 20,
                    ),
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
