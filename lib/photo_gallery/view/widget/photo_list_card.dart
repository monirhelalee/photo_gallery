import 'package:flutter/cupertino.dart';
import 'package:photo_gallery/resource/theme.dart';

class PhotoCardWidget extends StatelessWidget {
  const PhotoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
