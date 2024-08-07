import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/promotion_model.dart';

abstract class PromotionEvent extends Equatable {
  const PromotionEvent();

  @override
  List<Object> get props => [];
}

class LoadPromotions extends PromotionEvent {}

class CreatePromotion extends PromotionEvent {
  final PromotionModel promotion;

  CreatePromotion(this.promotion);

  @override
  List<Object> get props => [promotion];
}

class UpdatePromotion extends PromotionEvent {
  final PromotionModel promotion;

  UpdatePromotion(this.promotion);

  @override
  List<Object> get props => [promotion];
}

class DeletePromotion extends PromotionEvent {
  final String promotionId;

  DeletePromotion(this.promotionId);

  @override
  List<Object> get props => [promotionId];
}
