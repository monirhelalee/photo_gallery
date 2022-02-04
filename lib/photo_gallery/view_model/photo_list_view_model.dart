import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_gallery/photo_gallery/model/photo_list_model.dart';
import 'package:photo_gallery/photo_gallery/repository/photo_list_repo.dart';
import 'package:photo_gallery/utils/failure/app_error.dart';
import 'package:provider/src/provider.dart';

class PhotoListViewModel extends ChangeNotifier {
  static PhotoListViewModel read(BuildContext context) =>
      context.read<PhotoListViewModel>();

  static PhotoListViewModel watch(BuildContext context) =>
      context.watch<PhotoListViewModel>();

  bool _isLoading = false;
  bool _isMoreLoading = false;
  AppError? _appError;
  List<PhotoListModel> _photoListData = [];
  int pageIndex = 1;

  set isMoreLoading(bool value) {
    _isMoreLoading = value;
    notifyListeners();
  }

  Future<void> getPhotoListData() async {
    _isLoading = true;
    BotToast.showLoading(clickClose: true);
    var res = await PhotoListRepository().fetchPhotoListData();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      BotToast.closeAllLoading();
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _photoListData = r;
      BotToast.closeAllLoading();
      notifyListeners();
    });
  }

  Future<void> getMorePhotoListData() async {
    pageIndex++;
    isMoreLoading = true;
    var res =
        await PhotoListRepository().fetchPhotoListData(pageIndex: pageIndex);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      isMoreLoading = false;
      notifyListeners();
    }, (r) {
      isMoreLoading = false;
      _photoListData.addAll(r);
      notifyListeners();
    });
  }

  AppError? get appError => _appError!;

  bool get isMoreLoading => _isMoreLoading;

  List<PhotoListModel> get photoListData => _photoListData;

  bool get isLoading => _isLoading;
}
