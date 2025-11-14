import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/leave_request_history_model.dart';
import 'package:school_app/resources/app_colours.dart';
import 'package:school_app/resources/app_icons.dart';

class LeaveHistoryCard extends StatelessWidget {
  final LeaveRequestHistoryModel? leaveRequestHistory;
  const LeaveHistoryCard({super.key, this.leaveRequestHistory});

  @override
  Widget build(BuildContext context) {
    final leaveRequestHistories = leaveRequestHistory?.data ?? [];

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: leaveRequestHistories.isEmpty
          ? Column(
              children: [
                SectionTitle(title: "Leave History"),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Leave History Unavailable!",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            )
          : Column(
              children: leaveRequestHistories.map((item) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColours.hexToColor(
                      item.statusColor,
                    ).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColours.hexToColor(
                                  item.statusColor,
                                ).withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                AppIcons.statusIcon(item.status),
                                color: AppColours.hexToColor(item.statusColor),
                                size: 20,
                              ),
                            ),

                            Text(
                              "${item.status.capitalize}",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColours.hexToColor(item.statusColor),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start Date: ${item.startDate}"),
                            Text("End Date: ${item.endDate}"),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Description: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(item.description),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
