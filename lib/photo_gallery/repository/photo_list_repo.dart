import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_gallery/photo_gallery/model/photo_list_model.dart';
import 'package:photo_gallery/resource/urls.dart';
import 'package:photo_gallery/utils/api_client.dart';
import 'package:photo_gallery/utils/failure/app_error.dart';

class PhotoListRepository {
  Future<Either<AppError, List<PhotoListModel>>> fetchPhotoListData(
      {int pageIndex = 1}) async {
    var url = "${Urls.imageListUrl}?page=$pageIndex&limit=10";
    var response = await ApiClient().getRequest(url);
    debugPrint("photo list data ${response.body}");
    if (response.statusCode == 200) {
      List<PhotoListModel> data = photoListModelFromJson(response.body);
      return Right(data);
    } else {
      BotToast.closeAllLoading();
      return const Left(AppError.serverError);
    }
  }
}
