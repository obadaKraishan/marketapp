import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/notification_model.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNotification(NotificationModel notification) async {
    await _firestore
        .collection('notifications')
        .doc(notification.id)
        .set(notification.toMap());
  }

  Future<NotificationModel?> getNotification(String notificationId) async {
    DocumentSnapshot doc =
    await _firestore.collection('notifications').doc(notificationId).get();
    if (doc.exists) {
      return NotificationModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateNotification(NotificationModel notification) async {
    await _firestore
        .collection('notifications')
        .doc(notification.id)
        .update(notification.toMap());
  }

  Future<void> deleteNotification(String notificationId) async {
    await _firestore.collection('notifications').doc(notificationId).delete();
  }

  Future<List<NotificationModel>> getAllNotificationsForUser(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('notifications')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => NotificationModel.fromDocument(doc))
        .toList();
  }

  Future<void> markAsRead(String notificationId) async {
    await _firestore.collection('notifications').doc(notificationId).update({'read': true});
  }
}
