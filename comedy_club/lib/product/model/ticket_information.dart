import 'package:comedy_club/product/model/upcoming_shows.dart';
import 'package:flutter/material.dart';

@immutable

/// TicketInformation is a class that holds the information about a ticket.
final class TicketInformation {
  /// Creates a [TicketInformation].
  const TicketInformation({
    required this.ticketHolder,
    required this.show,
  });

  /// The show for which the ticket is purchased.
  final Shows show;

  /// The name of the ticket holder.
  final String ticketHolder;
}

@immutable

/// TicketList is a class that holds the list of tickets.
final class TicketList {
  const TicketList._();

  /// The list of tickets.
  static const ticketList = <TicketInformation>[
    TicketInformation(
      ticketHolder: 'John Doe',
      show: Shows(
        title: 'Comedy Night',
        date: 'Friday, 8:00 PM',
        location: 'Comedy Club',
        imageUrl: 'https://picsum.photos/200/300',
      ),
    ),
    TicketInformation(
      show: Shows(
        title: 'Stand-up Comedy',
        date: 'Saturday, 8:00 PM',
        location: 'Comedy Club',
        imageUrl: 'https://picsum.photos/200/300?grayscale',
      ),
      ticketHolder: 'Jane Doe',
    ),
  ];
}
