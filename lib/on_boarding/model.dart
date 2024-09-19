import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/assets.dart';

class OnBoardingModel {
  final String img, title, subTitle;

  OnBoardingModel({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    img: AssetsData.onBoarding1,
    title: AppStrings.onBoardingTitle1,
    subTitle: AppStrings.onBoardingSubTitle1,
  ),
  OnBoardingModel(
    img: AssetsData.onBoarding2,
    title: AppStrings.onBoardingTitle2,
    subTitle: AppStrings.onBoardingSubTitle2,
  ),
  OnBoardingModel(
    img: AssetsData.onBoarding3,
    title: AppStrings.onBoardingTitle3,
    subTitle: AppStrings.onBoardingSubTitle3,
  ),
];
