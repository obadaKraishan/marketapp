import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/support_ticket_model.dart';

abstract class SupportTicketEvent extends Equatable {
  const SupportTicketEvent();

  @override
  List<Object> get props => [];
}

class LoadSupportTickets extends SupportTicketEvent {
  final String userId;

  LoadSupportTickets(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreateSupportTicket extends SupportTicketEvent {
  final SupportTicketModel ticket;

  CreateSupportTicket(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class UpdateSupportTicket extends SupportTicketEvent {
  final SupportTicketModel ticket;

  UpdateSupportTicket(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class DeleteSupportTicket extends SupportTicketEvent {
  final String ticketId;

  DeleteSupportTicket(this.ticketId);

  @override
  List<Object> get props => [ticketId];
}
