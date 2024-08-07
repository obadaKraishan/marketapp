import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/support_ticket_model.dart';

class SupportTicketService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createSupportTicket(SupportTicketModel ticket) async {
    await _firestore.collection('support_tickets').doc(ticket.id).set(ticket.toMap());
  }

  Future<SupportTicketModel?> getSupportTicket(String ticketId) async {
    DocumentSnapshot doc = await _firestore.collection('support_tickets').doc(ticketId).get();
    if (doc.exists) {
      return SupportTicketModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateSupportTicket(SupportTicketModel ticket) async {
    await _firestore.collection('support_tickets').doc(ticket.id).update(ticket.toMap());
  }

  Future<void> deleteSupportTicket(String ticketId) async {
    await _firestore.collection('support_tickets').doc(ticketId).delete();
  }

  Future<List<SupportTicketModel>> getAllSupportTicketsForUser(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('support_tickets')
        .where('user_id', isEqualTo: userId)
        .get();
    return querySnapshot.docs
        .map((doc) => SupportTicketModel.fromDocument(doc))
        .toList();
  }
}
