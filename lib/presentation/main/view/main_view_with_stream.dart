import 'package:flutter/material.dart';
import 'package:task/app/dit.dart';
import 'package:task/domain/model/property_model.dart';
import 'package:task/presentation/main/view_model/home_view_model.dart';
import 'package:task/presentation/resources/styles_manager.dart';

import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/manager_values.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
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
      body: StreamBuilder<StateFlow>(
        stream: _homeViewModel.outputState,
        builder: (context, snapshot) =>
            (snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _homeViewModel.getData();
            })) ??
            _getContentWidget(),
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      color: ColorManager.white,
      child: StreamBuilder<PropertyData>(
            stream: _homeViewModel.outputProperty ,

          builder: (context, snapshot) => _showPropertyData(snapshot.data)),
    );
  }

  Widget _showPropertyData(PropertyData? propertyData) {
    if (propertyData == null) {
      return Container();
    } else {
      return Center(
        child: Container(
          child: Text(
            propertyData.description,
            style: getRegularStyle(color: Colors.red),
          ),
        ),
      );
    }
  }
}
