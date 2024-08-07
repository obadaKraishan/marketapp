import 'package:marketapp/data/models/support_ticket_model.dart';
import 'package:marketapp/services/support_ticket_service.dart';

class SupportTicketRepository {
  final SupportTicketService _supportTicketService = SupportTicketService();

  Future<void> createSupportTicket(SupportTicketModel ticket) async {
    await _supportTicketService.createSupportTicket(ticket);
  }

  Future<SupportTicketModel?> getSupportTicket(String ticketId) async {
    return await _supportTicketService.getSupportTicket(ticketId);
  }

  Future<void> updateSupportTicket(SupportTicketModel ticket) async {
    await _supportTicketService.updateSupportTicket(ticket);
  }

  Future<void> deleteSupportTicket(String ticketId) async {
    await _supportTicketService.deleteSupportTicket(ticketId);
  }

  Future<List<SupportTicketModel>> getAllSupportTicketsForUser(String userId) async {
    return await _supportTicketService.getAllSupportTicketsForUser(userId);
  }
}
