import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  Future<void> share({required String url, required String title}) async {
    BotToast.showLoading(clickClose: true);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/$title.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path]);
    try {
      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Something wrong! Please try again.");
    }
  }
}
