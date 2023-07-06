import '../utils/app_images.dart';
import '../utils/app_string.dart';

class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(img: AppImages.intro_two, title: AppString.the_best_train, subTitle: AppString.lorem),
  Items(img: AppImages.intro_one, title: AppString.booktickets, subTitle: AppString.lorem),
  Items(img: AppImages.intro_three, title: AppString.letstart, subTitle: AppString.lorem),
];
