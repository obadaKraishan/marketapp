import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/order_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;

  OrderBloc(this._orderRepository) : super(OrderInitial()) {
    on<LoadOrder>((event, emit) async {
      emit(OrderLoading());
      try {
        final order = await _orderRepository.getOrder(event.orderId);
        if (order != null) {
          emit(OrderLoaded(order));
        } else {
          emit(OrderError("Order not found"));
        }
      } catch (e) {
        emit(OrderError(e.toString()));
      }
    });

    on<CreateOrder>((event, emit) async {
      emit(OrderLoading());
      try {
        await _orderRepository.createOrder(event.order);
        emit(OrderLoaded(event.order));
      } catch (e) {
        emit(OrderError(e.toString()));
      }
    });

    on<UpdateOrder>((event, emit) async {
      emit(OrderLoading());
      try {
        await _orderRepository.updateOrder(event.order);
        emit(OrderLoaded(event.order));
      } catch (e) {
        emit(OrderError(e.toString()));
      }
    });

    on<DeleteOrder>((event, emit) async {
      emit(OrderLoading());
      try {
        await _orderRepository.deleteOrder(event.orderId);
        emit(OrderInitial());
      } catch (e) {
        emit(OrderError(e.toString()));
      }
    });
  }
}
