import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class DownloadHelper {
  Future<void> downloadImage({required String url}) async {
    BotToast.showLoading();
    try {
      var imageId = await ImageDownloader.downloadImage(url);
      if (imageId == null) {
        BotToast.closeAllLoading();
        BotToast.showText(text: "Something wrong, Please try again!");
        return;
      }
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
      BotToast.closeAllLoading();
      BotToast.showText(
          text:
              "Download Successful!\nImage can be found in the download folder");
    } on PlatformException catch (error) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something wrong, Please try again!");
    }
  }
}
