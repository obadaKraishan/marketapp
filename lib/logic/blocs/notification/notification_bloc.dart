import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/notification_repository.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository;

  NotificationBloc(this._notificationRepository) : super(NotificationInitial()) {
    on<LoadNotifications>((event, emit) async {
      emit(NotificationLoading());
      try {
        final notifications = await _notificationRepository.getNotifications(event.userId);
        emit(NotificationLoaded(notifications));
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });

    on<MarkNotificationAsRead>((event, emit) async {
      try {
        await _notificationRepository.markAsRead(event.notificationId);
        // Reload notifications for the user after marking as read
        final notifications = await _notificationRepository.getNotifications(event.userId);
        emit(NotificationLoaded(notifications));
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });
  }
}
