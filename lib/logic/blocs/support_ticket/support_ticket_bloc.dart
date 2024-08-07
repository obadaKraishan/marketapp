import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketapp/data/repositories/support_ticket_repository.dart';
import 'support_ticket_event.dart';
import 'support_ticket_state.dart';

class SupportTicketBloc extends Bloc<SupportTicketEvent, SupportTicketState> {
  final SupportTicketRepository _supportTicketRepository;

  SupportTicketBloc(this._supportTicketRepository) : super(SupportTicketInitial()) {
    on<LoadSupportTickets>((event, emit) async {
      emit(SupportTicketLoading());
      try {
        final tickets = await _supportTicketRepository.getAllSupportTicketsForUser(event.userId);
        emit(SupportTicketLoaded(tickets));
      } catch (e) {
        emit(SupportTicketError(e.toString()));
      }
    });

    on<CreateSupportTicket>((event, emit) async {
      emit(SupportTicketLoading());
      try {
        await _supportTicketRepository.createSupportTicket(event.ticket);
        final tickets = await _supportTicketRepository.getAllSupportTicketsForUser(event.ticket.userId);
        emit(SupportTicketLoaded(tickets));
      } catch (e) {
        emit(SupportTicketError(e.toString()));
      }
    });

    on<UpdateSupportTicket>((event, emit) async {
      emit(SupportTicketLoading());
      try {
        await _supportTicketRepository.updateSupportTicket(event.ticket);
        final tickets = await _supportTicketRepository.getAllSupportTicketsForUser(event.ticket.userId);
        emit(SupportTicketLoaded(tickets));
      } catch (e) {
        emit(SupportTicketError(e.toString()));
      }
    });

    on<DeleteSupportTicket>((event, emit) async {
      emit(SupportTicketLoading());
      try {
        await _supportTicketRepository.deleteSupportTicket(event.ticketId);
        final tickets = await _supportTicketRepository.getAllSupportTicketsForUser(event.ticketId);
        emit(SupportTicketLoaded(tickets));
      } catch (e) {
        emit(SupportTicketError(e.toString()));
      }
    });
  }
}
