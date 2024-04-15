import 'package:ecommerce/data/repositories/banners/banner_repository.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //* Variables
  final carousalCurrentindex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //* Update Navigation Dots
  void updatePageIndicator(index) {
    carousalCurrentindex.value = index;
  }

  //* Load Banner
  Future<void> fetchBanners() async {
    try {
      // Show Loader
      isLoading.value = true;

      // fetch Banner from the source
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanner();

      // Assign Banner
      this.banners.assignAll(banners);
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
