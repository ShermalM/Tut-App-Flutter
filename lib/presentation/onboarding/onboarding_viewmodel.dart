import 'dart:async';

import 'package:complete_advanced_flutter/domain/model/model.dart';
import 'package:complete_advanced_flutter/presentation/base/baseviewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    // send this slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex >= _list.length) _currentIndex = 0; // infinite loop
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex < 0) _currentIndex = _list.length - 1; // infinite loop
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: AppStrings.onboardingTitle1,
          subTitle: AppStrings.onboardingSubTitle1,
          image: ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          title: AppStrings.onboardingTitle2,
          subTitle: AppStrings.onboardingSubTitle2,
          image: ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          title: AppStrings.onboardingTitle3,
          subTitle: AppStrings.onboardingSubTitle3,
          image: ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          title: AppStrings.onboardingTitle4,
          subTitle: AppStrings.onboardingSubTitle4,
          image: ImageAssets.onboardingLogo4,
        ),
      ];

  _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
      sliderObject: _list[_currentIndex],
      numberOfSlides: _list.length,
      currentIndex: _currentIndex,
    ));
  }
}

// inputs mean the orders that our viewmodel will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe
  void goPrevious(); // when user clicks on left arrow or swipe
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean the data or results that will be sent from our viewmodel to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numberOfSlides,
    required this.currentIndex,
  });
}
