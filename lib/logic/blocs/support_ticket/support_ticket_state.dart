import 'package:equatable/equatable.dart';
import 'package:marketapp/data/models/support_ticket_model.dart';

abstract class SupportTicketState extends Equatable {
  const SupportTicketState();

  @override
  List<Object> get props => [];
}

class SupportTicketInitial extends SupportTicketState {}

class SupportTicketLoading extends SupportTicketState {}

class SupportTicketLoaded extends SupportTicketState {
  final List<SupportTicketModel> tickets;

  SupportTicketLoaded(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class SupportTicketError extends SupportTicketState {
  final String message;

  SupportTicketError(this.message);

  @override
  List<Object> get props => [message];
}
