import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class WallPaperSetHelper {
  Future<void> setWallpaper({required location, required String url}) async {
    BotToast.showLoading(clickClose: true);
    var file = await DefaultCacheManager().getSingleFile(url);
    try {
      WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      BotToast.closeAllLoading();
      BotToast.showText(text: "Wallpaper set Successfully!");
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something wrong! Please try again.");
    }
  }
}
