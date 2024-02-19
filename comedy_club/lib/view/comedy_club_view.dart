import 'package:comedy_club/product/enum/image_enum.dart';
import 'package:comedy_club/product/model/ticket_information.dart';
import 'package:comedy_club/product/model/upcoming_shows.dart';
import 'package:flutter/material.dart';

/// This is the view for the Comedy Club app.
final class ComedyClubView extends StatelessWidget {
  /// Creates a [ComedyClubView].
  const ComedyClubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comedy Club',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: const <Widget>[
            _ComedyClubImage(),
            _ComedyClubHeader(),
            SizedBox(
              height: 20,
            ),
            _UpcomingShowsTitle(),
            _UpcomingShowList(),
            _UserTicketListTitle(),
            _UserTicketList(),
          ],
        ),
      ),
    );
  }
}

final class _ComedyClubHeader extends StatelessWidget {
  const _ComedyClubHeader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Welcome to Comedy Club!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

final class _UserTicketListTitle extends StatelessWidget {
  const _UserTicketListTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your Tickets',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

final class _UserTicketList extends StatelessWidget {
  const _UserTicketList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: TicketList.ticketList.length,
        itemBuilder: (BuildContext context, int index) {
          return _UserTicketCard(
            index,
          );
        },
      ),
    );
  }
}

final class _UserTicketCard extends StatelessWidget {
  const _UserTicketCard(
    this.index,
  );

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                TicketList.ticketList[index].show.imageUrl,
                fit: BoxFit.contain,
                height: 125,
              ),
            ),
            Text(
              'Ticket Holder: ${TicketList.ticketList[index].ticketHolder}',
            ),
            const Spacer(),
            Text(
              TicketList.ticketList[index].show.title,
            ),
            Text(
              TicketList.ticketList[index].show.date,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

final class _UpcomingShowsTitle extends StatelessWidget {
  const _UpcomingShowsTitle();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Upcoming Shows',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

final class _UpcomingShowList extends StatelessWidget {
  const _UpcomingShowList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: UpcomingShowsList.upcomingShows.length,
        itemBuilder: (BuildContext context, int index) {
          final show = UpcomingShowsList.upcomingShows[index];
          return _ShowsCard(show: show);
        },
      ),
    );
  }
}

final class _ShowsCard extends StatelessWidget {
  const _ShowsCard({
    required this.show,
  });

  final Shows show;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                show.imageUrl,
                fit: BoxFit.contain,
                height: 125,
              ),
            ),
            const Spacer(),
            Text(show.title),
            Text(show.date),
            const Spacer(),
            Text(show.location),
          ],
        ),
      ),
    );
  }
}

final class _ComedyClubImage extends StatelessWidget {
  const _ComedyClubImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          ImageEnum.imgComedyClub.value,
        ),
      ),
    );
  }
}
