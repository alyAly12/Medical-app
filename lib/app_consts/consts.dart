import '../model/category_model.dart';
import 'assets_manager.dart';

class AppConsts {
  static List<CategoryModel> categoryList = [
    CategoryModel(
        id: AssetsManager.gyno,
        name: 'Glands',
        image: AssetsManager.gyno,
        subTitle: 'Specialist'),
    CategoryModel(
        id: AssetsManager.cardio,
        name: 'Cardiology',
        image: AssetsManager.cardio,
        subTitle: 'PHD'),
    CategoryModel(
        id: AssetsManager.derma,
        name: 'Dermatology',
        image: AssetsManager.derma,
        subTitle: 'Specialist'),
    CategoryModel(
        id: AssetsManager.eye,
        name: 'ophthalmologist ',
        image: AssetsManager.eye,
        subTitle: 'Specialist'),
    CategoryModel(
        id: AssetsManager.ear,
        name: 'Ear care',
        image: AssetsManager.ear,
        subTitle: 'PHD'),
    CategoryModel(
        id: AssetsManager.bones,
        name: 'Bones',
        image: AssetsManager.bones,
        subTitle: 'new'),
    CategoryModel(
        id: AssetsManager.urolo,
        name: 'Urologists',
        image: AssetsManager.urolo,
        subTitle: ' Specialist'),
  ];
}
