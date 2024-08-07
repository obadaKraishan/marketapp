import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/payment_method_repository.dart';
import 'payment_method_event.dart';
import 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final PaymentRepository _paymentMethodRepository;

  PaymentMethodBloc(this._paymentMethodRepository) : super(PaymentMethodInitial()) {
    on<LoadPaymentMethod>((event, emit) async {
      emit(PaymentMethodLoading());
      try {
        final paymentMethod = await _paymentMethodRepository.getPaymentMethod(event.paymentMethodId);
        if (paymentMethod != null) {
          emit(PaymentMethodLoaded(paymentMethod));
        } else {
          emit(PaymentMethodError("Payment method not found"));
        }
      } catch (e) {
        emit(PaymentMethodError(e.toString()));
      }
    });

    on<CreatePaymentMethod>((event, emit) async {
      emit(PaymentMethodLoading());
      try {
        await _paymentMethodRepository.createPaymentMethod(event.paymentMethod);
        emit(PaymentMethodLoaded(event.paymentMethod));
      } catch (e) {
        emit(PaymentMethodError(e.toString()));
      }
    });

    on<UpdatePaymentMethod>((event, emit) async {
      emit(PaymentMethodLoading());
      try {
        await _paymentMethodRepository.updatePaymentMethod(event.paymentMethod);
        emit(PaymentMethodLoaded(event.paymentMethod));
      } catch (e) {
        emit(PaymentMethodError(e.toString()));
      }
    });

    on<DeletePaymentMethod>((event, emit) async {
      emit(PaymentMethodLoading());
      try {
        await _paymentMethodRepository.deletePaymentMethod(event.paymentMethodId);
        emit(PaymentMethodInitial());
      } catch (e) {
        emit(PaymentMethodError(e.toString()));
      }
    });
  }
}
