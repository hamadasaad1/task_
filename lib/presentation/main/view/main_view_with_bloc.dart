import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/domain/model/property_model.dart';
import 'package:task/presentation/common/state_renderer/state_renderer.dart';
import 'package:task/presentation/main/view/page_view_feature.dart';
import 'package:task/presentation/resources/font_manager.dart';
import 'package:task/presentation/resources/routes_manager.dart';
import 'package:task/presentation/resources/styles_manager.dart';

import '../../common/expanded_text.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/manager_values.dart';
import '../view_model/view_cubit/view_cubit.dart';

class MainViewCubit extends StatefulWidget {
  MainViewCubit({Key? key}) : super(key: key);

  @override
  State<MainViewCubit> createState() => _MainViewCubitState();
}

class _MainViewCubitState extends State<MainViewCubit>
    with SingleTickerProviderStateMixin {
  late ViewCubit _homeViewModel;

  String appBarTitle = 'Room';

  late TabController _tabControl;
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _tabControl = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: AppSize.s0,
        centerTitle: true,
        title: Text(appBarTitle,
            style: getMediumStyle(
                color: ColorManager.textHeaderColor, fontSize: FontSize.s18)),
        leading: Icon(Icons.arrow_back,
            color: ColorManager.primary, size: AppSize.s35),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSize.s18),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: ColorManager.primary,
                  size: AppSize.s35,
                )),
          )
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Reserve',
                style: getRegularStyle(color: ColorManager.textColor),
              )),
        ),
      ),
      body: BlocProvider<ViewCubit>(
        create: (context) {
          _homeViewModel = ViewCubit();

          _homeViewModel.inputSate.add(
              LoadingState(stateRendererType: StateRendererType.contentState));
          _homeViewModel.getData();
          return _homeViewModel;
        },
        child: BlocConsumer<ViewCubit, ViewState>(
          listener: (context, state) {
            if (state is ViewStateSuccess) {
              getAppBarTitle(state.data.title);
            }
          },
          builder: (context, state) {
            return StreamBuilder<StateFlow>(
              stream: _homeViewModel.outputState,
              builder: (context, snapshot) =>
                  (snapshot.data?.getScreenWidget(
                      context,
                      state is ViewStateSuccess
                          ? _getContentWidget(state.data)
                          : Container(), () {
                    _homeViewModel.getData();
                  })) ??
                  _getContentWidget(null),
            );
          },
        ),
      ),
    );
  }

  void getAppBarTitle(String title) {
    setState(() {
      appBarTitle = title;
    });
  }

  Widget _getContentWidget(PropertyData? propertyData) {
    if (propertyData == null) {
      return Container();
    } else {
      return SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSize.s20),
            _buildTabView(),
            Expanded(
              child: Container(
                color: ColorManager.darkGrey.withOpacity(.1),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppMargin.m18, vertical: AppMargin.m18),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.darkGrey.withOpacity(.1),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ],
                  ),
                  child: ListView(
                    children: [
                      Text(
                        propertyData.relatedSection.title,
                        style: getRegularStyle(
                            color: ColorManager.textSubTitleColor,
                            fontSize: FontSize.s18),
                      ),
                      const SizedBox(height: AppSize.s20),
                      _buildRateView(),
                      const SizedBox(height: AppSize.s20),
                      _buildCarouselSlider(
                          propertyData.relatedSection.relatedProperties),
                      const SizedBox(height: AppSize.s20),
 Text(
                        'Facilities',
                        style: getRegularStyle(
                            color: ColorManager.textSubTitleColor,
                            fontSize: FontSize.s18),
                      ),

                      const SizedBox(height: AppSize.s20),

                        SizedBox(
                          
                            height:200,
                            child: FeatureViewPage(
                              features: propertyData.features,
                            )),
                      const SizedBox(height: AppSize.s20),
                      ExpandableText(propertyData.description),

                      const SizedBox(height: AppSize.s20),
                      Container(
                          color: ColorManager.lightGrey,
                          height: AppSize.s1_5,
                          width: double.infinity),
const SizedBox(height: AppSize.s20),
                           Text(
                        'Location',
                        style: getRegularStyle(
                            color: ColorManager.textSubTitleColor,
                            fontSize: FontSize.s18),
                      ),

                      const SizedBox(height: AppSize.s8),
                           Text(
                        propertyData.mapSection.address,
                        style: getRegularStyle(
                            color: ColorManager.textColor,
                            fontSize: FontSize.s14),
                      ),
                      const SizedBox(height: AppSize.s60),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildRateView() {
    return Row(children: [

                      Icon(Icons.calendar_month_rounded,color: ColorManager.primary,),
const SizedBox(width: AppSize.s4),
                      Text(
                      'Hotel',
                      style: getRegularStyle(
                          color: ColorManager.primary,
                          fontSize: 18),
                    ),
                    const Spacer(),

                    RatingBar.builder(
 initialRating: 3.5,
 minRating: 1,
 direction: Axis.horizontal,
 allowHalfRating: false,
 itemSize: AppSize.s28,
 itemCount: 5,
 itemPadding:const  EdgeInsets.symmetric(horizontal: 2.0),
 itemBuilder: (context, _) =>const  Icon(
   Icons.star,
   color: Colors.amber,
 ),
 onRatingUpdate: (rating) {
   
 },
),

const SizedBox(width: AppSize.s4),

 Text(
                      '3.5',
                      style: getRegularStyle(
                          color: ColorManager.primary,
                          fontSize: 18),
                    ),
                    ],);
  }

  int currentCarouselSliderIndex = 0;

  Widget _buildCarouselSlider(List<RelatedProperty> relatedProperties) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (int index, carouse) {
                setState(() {
                  currentCarouselSliderIndex = index;
                });
              }),
          items: relatedProperties.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: CachedNetworkImage(
                        imageUrl: i.featuredImage,
                        placeholder: (context, url) =>
                            Image.asset(ImagesAssets.imageLoading),
                        errorWidget: (context, url, error) =>
                            Image.asset(ImagesAssets.imageLoading),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                );
              },
            );
          }).toList(),
        ),
     
        Positioned(
          right: 0.0,
          left: 0.0,
          bottom: AppSize.s20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: relatedProperties.map((url) {
              int index = relatedProperties.indexOf(url);
              return Container(
                width: AppSize.s12,
                height: AppSize.s12,
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m4),
                decoration: BoxDecoration(
                    color: currentCarouselSliderIndex == index
                        ? ColorManager.primary
                        : ColorManager.white,
                    shape: BoxShape.circle),
              );
            }).toList(),
          ),
        ),

        Positioned(
          bottom: AppSize.s12,
          right:AppSize.s8,
          child: InkWell(
            onTap: (){
 Navigator.pushNamed(context, Routes.fullImageRoute,
 arguments: {'imageUrl':relatedProperties[currentCarouselSliderIndex].featuredImage}
 );

            },
            child:  Icon(Icons.zoom_in_map_rounded,size: AppSize.s35,
            color: ColorManager.primary,)))
      ],
    );
  }

  

  Widget _buildTabView() {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: TabBar(
            controller: _tabControl,
            unselectedLabelColor: Colors.grey,
            labelColor: ColorManager.textHeaderColor,
            isScrollable: false,
            labelStyle:
                getRegularStyle(color: ColorManager.textColor, fontSize: 18),
            unselectedLabelStyle:
                getRegularStyle(color: ColorManager.textColor, fontSize: 18),
            indicatorColor: ColorManager.primary,
            onTap: (value) {},
            tabs: const [
              Text('Info'),
              Text(
                'Reviews',
              ),
            ]),
      ),
    );
  }
}
