import 'package:flutter/material.dart';
import 'package:school_app/models/school_contacts_model.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickContactsCard extends StatelessWidget {
  final SchoolContactsModel? schoolContactsData;
  const QuickContactsCard({super.key, this.schoolContactsData});

  Future<void> _launchDialer(BuildContext context, String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);

    try {
      final success = await launchUrl(url);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Could not open dialer"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final schoolContacts = schoolContactsData?.data ?? [];

    if (schoolContacts.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text("Contacts Unavailable!")),
      );
    }

    return Column(
      children: schoolContacts.map((contact) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // ICON SECTION
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade50,
                ),
                child: const Icon(Icons.apartment_rounded),
              ),

              const SizedBox(width: 12),

              // DETAILS SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            contact.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _launchDialer(context, contact.phone);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.call_outlined,
                                    size: 18,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  // Add email function here
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.mail_outlined,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(Icons.call_outlined, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          contact.phone,
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(Icons.mail_outlined, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          contact.email,
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(Icons.schedule_outlined, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          "${contact.days} | ${contact.time}",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
