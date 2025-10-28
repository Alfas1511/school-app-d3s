import 'package:flutter/material.dart';
import 'package:school_app/models/events_list_model.dart';

class EventsListCard extends StatefulWidget {
  final EventsListModel eventsList;
  final Function(int?) onEventSelected;
  final int? selectedEventId;
  const EventsListCard({
    super.key,
    required this.eventsList,
    required this.onEventSelected,
    this.selectedEventId,
  });

  @override
  State<EventsListCard> createState() => _EventsListCardState();
}

class _EventsListCardState extends State<EventsListCard> {
  String? selectedActivity;
  int? selectedEventId;

  @override
  void initState() {
    super.initState();
    selectedEventId = widget.selectedEventId;
  }

  @override
  void didUpdateWidget(covariant EventsListCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ✅ Keep parent-selected ID in sync
    if (oldWidget.selectedEventId != widget.selectedEventId) {
      selectedEventId = widget.selectedEventId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final events = widget.eventsList.data;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filter by Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(event.eventName),
                    selected: selectedEventId == event.id,
                    onSelected: (selected) {
                      setState(() {
                        if (selectedEventId == event.id) {
                          selectedEventId = null;
                          widget.onEventSelected(null);
                        } else {
                          selectedEventId = event.id;
                          widget.onEventSelected(event.id);
                        }
                      });
                    },
                    selectedColor: const Color(0xFF6A11CB),
                    labelStyle: TextStyle(
                      color: selectedEventId == event.id
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
