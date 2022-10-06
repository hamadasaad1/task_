import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:task/presentation/resources/assets_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/manager_values.dart';

class ViewImageWidget extends StatefulWidget {
  String url;
  ViewImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<ViewImageWidget> createState() => _ViewImageWidgetState();
}

class _ViewImageWidgetState extends State<ViewImageWidget> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 100, // or whatever offset you wish
    keepScrollOffset: true,
  );

  String imageUrl = '';
  @override
  void initState() {
    super.initState();
    imageUrl = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: AppSize.s0,
     
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back,
              color: ColorManager.primary, size: AppSize.s35),
        ),
       ),
      body: buildImageView());
  }

  Widget buildImageView() {
    return Container(
        alignment: Alignment.center,
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          loadingBuilder: (context, event) =>
              Image.asset(ImagesAssets.imageLoading),
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(ImagesAssets.imageLoading),
          imageProvider: NetworkImage(imageUrl),
          // imageProvider: AssetImage('assets/images/image_loading_bg.png'),
        ));
  }
}
