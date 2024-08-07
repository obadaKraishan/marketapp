import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/banner_model.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class LoadBanners extends BannerEvent {}

class CreateBanner extends BannerEvent {
  final BannerModel banner;

  CreateBanner(this.banner);

  @override
  List<Object> get props => [banner];
}

class UpdateBanner extends BannerEvent {
  final BannerModel banner;

  UpdateBanner(this.banner);

  @override
  List<Object> get props => [banner];
}

class DeleteBanner extends BannerEvent {
  final String bannerId;

  DeleteBanner(this.bannerId);

  @override
  List<Object> get props => [bannerId];
}
