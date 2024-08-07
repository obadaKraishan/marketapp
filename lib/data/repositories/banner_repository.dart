import 'package:marketapp/data/models/banner_model.dart';
import 'package:marketapp/services/banner_service.dart';

class BannerRepository {
  final BannerService _bannerService = BannerService();

  Future<void> createBanner(BannerModel banner) async {
    await _bannerService.createBanner(banner);
  }

  Future<BannerModel?> getBanner(String bannerId) async {
    return await _bannerService.getBanner(bannerId);
  }

  Future<void> updateBanner(BannerModel banner) async {
    await _bannerService.updateBanner(banner);
  }

  Future<void> deleteBanner(String bannerId) async {
    await _bannerService.deleteBanner(bannerId);
  }

  Future<List<BannerModel>> getAllBanners() async {
    return await _bannerService.getAllBanners();
  }
}
