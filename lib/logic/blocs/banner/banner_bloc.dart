import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/banner_repository.dart';
import 'banner_event.dart';
import 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository _bannerRepository;

  BannerBloc(this._bannerRepository) : super(BannerInitial()) {
    on<LoadBanners>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await _bannerRepository.getAllBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });

    on<CreateBanner>((event, emit) async {
      emit(BannerLoading());
      try {
        await _bannerRepository.createBanner(event.banner);
        final banners = await _bannerRepository.getAllBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });

    on<UpdateBanner>((event, emit) async {
      emit(BannerLoading());
      try {
        await _bannerRepository.updateBanner(event.banner);
        final banners = await _bannerRepository.getAllBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });

    on<DeleteBanner>((event, emit) async {
      emit(BannerLoading());
      try {
        await _bannerRepository.deleteBanner(event.bannerId);
        final banners = await _bannerRepository.getAllBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });
  }
}
