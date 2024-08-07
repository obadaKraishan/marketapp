import 'package:marketapp/data/models/notification_model.dart';
import 'package:marketapp/services/notification_service.dart';

class NotificationRepository {
  final NotificationService _notificationService = NotificationService();

  Future<void> createNotification(NotificationModel notification) async {
    await _notificationService.createNotification(notification);
  }

  Future<NotificationModel?> getNotification(String notificationId) async {
    return await _notificationService.getNotification(notificationId);
  }

  Future<void> updateNotification(NotificationModel notification) async {
    await _notificationService.updateNotification(notification);
  }

  Future<void> deleteNotification(String notificationId) async {
    await _notificationService.deleteNotification(notificationId);
  }

  Future<List<NotificationModel>> getNotifications(String userId) async {
    return await _notificationService.getAllNotificationsForUser(userId);
  }

  Future<void> markAsRead(String notificationId) async {
    await _notificationService.markAsRead(notificationId);
  }
}
