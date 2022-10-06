import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/manager_values.dart';
import 'package:task/presentation/resources/styles_manager.dart';

import '../../../domain/model/property_model.dart';
import '../../resources/assets_manager.dart';

class FeatureViewPage extends StatefulWidget {
  final List<List<Feature>> features;

  const FeatureViewPage({
    Key? key,
    required this.features,
  }) : super(key: key);

  @override
  State<FeatureViewPage> createState() => _FeatureViewPageState();
}

class _FeatureViewPageState extends State<FeatureViewPage> {
  List<List<Feature>> features = [];

  int listBreakerSize = 4;
  int currentIndex = 0;
  int pageIndex = 0;
  
  @override
  void initState() {
    features.addAll(widget.features);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: PageView.builder(
           
            onPageChanged: (int page) {
              setState(() {
                pageIndex = page;
              });
            },
            physics: const BouncingScrollPhysics(),
            itemCount: features.length,
            itemBuilder: (context, i) => GridView.builder(
            
           //   physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: listBreakerSize,
                crossAxisSpacing: 1,
                mainAxisSpacing: 2,
                childAspectRatio: 4 / 3.5,
              ),
              itemCount: features[i].length,
              primary: false,
              itemBuilder: (context, index) =>
                  buildMenuItemWidget(feature: features[i][index]),
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
      ),
    ]);
  }

  buildMenuItemWidget({
    required Feature feature,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 1, bottom: 2),
        child: Center(
          child: Column(
            children: [
             ColorFiltered(
             colorFilter: ColorFilter.mode(
              feature.isActive
                          ? ColorManager.primary
                          : 
              Colors.transparent, BlendMode.color),
                child: CachedNetworkImage(
                  imageUrl: feature.image,
                  placeholder: (context, url) =>
                      Image.asset(ImagesAssets.imageLoading),
                  errorWidget: (context, url, error) =>
                      Image.asset(ImagesAssets.imageLoading),
                  height: AppSize.s35,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: AppSize.s4),
              Text(feature.description,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(
                      color: ColorManager.textColor)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      width: AppSize.s12,
      height: AppSize.s12,
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m4),
      decoration: BoxDecoration(
          color: isActive ? ColorManager.primary : ColorManager.lightGrey,
          shape: BoxShape.circle),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < features.length; i++) {
      list.add(i == pageIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }
}
