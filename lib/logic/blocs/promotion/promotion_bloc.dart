import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/promotion_repository.dart';
import 'promotion_event.dart';
import 'promotion_state.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  final PromotionRepository _promotionRepository;

  PromotionBloc(this._promotionRepository) : super(PromotionInitial()) {
    on<LoadPromotions>((event, emit) async {
      emit(PromotionLoading());
      try {
        final promotions = await _promotionRepository.getAllPromotions();
        emit(PromotionLoaded(promotions));
      } catch (e) {
        emit(PromotionError(e.toString()));
      }
    });

    on<CreatePromotion>((event, emit) async {
      emit(PromotionLoading());
      try {
        await _promotionRepository.createPromotion(event.promotion);
        final promotions = await _promotionRepository.getAllPromotions();
        emit(PromotionLoaded(promotions));
      } catch (e) {
        emit(PromotionError(e.toString()));
      }
    });

    on<UpdatePromotion>((event, emit) async {
      emit(PromotionLoading());
      try {
        await _promotionRepository.updatePromotion(event.promotion);
        final promotions = await _promotionRepository.getAllPromotions();
        emit(PromotionLoaded(promotions));
      } catch (e) {
        emit(PromotionError(e.toString()));
      }
    });

    on<DeletePromotion>((event, emit) async {
      emit(PromotionLoading());
      try {
        await _promotionRepository.deletePromotion(event.promotionId);
        final promotions = await _promotionRepository.getAllPromotions();
        emit(PromotionLoaded(promotions));
      } catch (e) {
        emit(PromotionError(e.toString()));
      }
    });
  }
}
