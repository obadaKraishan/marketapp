import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/promotion_model.dart';

abstract class PromotionState extends Equatable {
  const PromotionState();

  @override
  List<Object> get props => [];
}

class PromotionInitial extends PromotionState {}

class PromotionLoading extends PromotionState {}

class PromotionLoaded extends PromotionState {
  final List<PromotionModel> promotions;

  PromotionLoaded(this.promotions);

  @override
  List<Object> get props => [promotions];
}

class PromotionError extends PromotionState {
  final String message;

  PromotionError(this.message);

  @override
  List<Object> get props => [message];
}
