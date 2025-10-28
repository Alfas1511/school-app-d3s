import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/events_images_model.dart';
import 'package:school_app/models/events_list_model.dart';
import 'package:school_app/views/gallery/event_images_card.dart';
import 'package:school_app/views/gallery/events_list_card.dart';
import 'package:school_app/views/gallery/upcoming_events_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool isLoading = true;
  EventsListModel? eventsList;
  EventImagesModel? eventImages;
  int? selectedEventId;

  @override
  void initState() {
    super.initState();
    _fetchEventsList();
    _fetchEventImagesList();
  }

  /// Fetch Events List
  Future<void> _fetchEventsList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();
      final response = await apiService.getRequest(
        ApiConstants.eventsList,
        token: token,
      );
      debugPrint("Error fetching events list: $response");

      if (response['status'] == true) {
        final fetchedEvents = EventsListModel.fromJson(response);
        setState(() {
          eventsList = fetchedEvents;
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      debugPrint("Error fetching events list: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Fetch Event Images List
  Future<void> _fetchEventImagesList({int? eventId}) async {
    setState(() => isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      final apiService = ApiService();

      // ✅ When eventId is null, fetch all images (no filter)
      final response = await apiService.postRequest(
        ApiConstants.eventsImagesList,
        eventId != null ? {'event_id': eventId} : {},
        token: token,
      );

      if (response['status'] == true) {
        final fetchedImages = EventImagesModel.fromJson(response);
        setState(() {
          eventImages = fetchedImages;
          selectedEventId = eventId; // store which event is selected
        });
      }
    } catch (e) {
      debugPrint("Error fetching event images: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gallery",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "School Events & Activities",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (eventsList != null)
                    EventsListCard(
                      eventsList: eventsList!,
                      onEventSelected: (eventId) {
                        _fetchEventImagesList(eventId: eventId);
                      },
                      selectedEventId:
                          selectedEventId, // ✅ Pass current selected
                    ),

                  const SizedBox(height: 20),

                  if (eventImages != null)
                    EventImagesCard(eventImages: eventImages!),

                  const SizedBox(height: 20),

                  UpcomingEventsCard(),
                ],
              ),
            ),
    );
  }
}
