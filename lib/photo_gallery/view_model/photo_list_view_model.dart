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

  bool _isFetchingData = false;
  bool _isLoading = false;
  AppError? _appError;
  List<PhotoListModel> _photoListData = [];

  Future<void> getPhotoListData() async {
    _isFetchingData = true;
    _isLoading = true;
    var res = await PhotoListRepository().fetchPhotoListData();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _isFetchingData = false;
      _photoListData = r;
      notifyListeners();
    });
  }

  AppError? get appError => _appError!;

  bool get isFetchingData => _isFetchingData;

  List<PhotoListModel> get photoListData => _photoListData;

  bool get isLoading => _isLoading;
}
