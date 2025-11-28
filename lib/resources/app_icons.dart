import 'package:flutter/material.dart';

class AppIcons {
  static const IconData phone = Icons.phone;
  static const IconData lock = Icons.lock;
  static const IconData backArrow = Icons.arrow_back;
  static const IconData rightArrow = Icons.arrow_right;
  static const IconData help = Icons.help;
  static const IconData privacy = Icons.privacy_tip;
  static const IconData call = Icons.call;
  static const IconData settings = Icons.settings;
  static const IconData notifications = Icons.notifications;
  static const IconData camera = Icons.camera;
  static const IconData calendarMonth = Icons.calendar_month;
  static const IconData money = Icons.money;
  static const IconData workspacePremium = Icons.workspace_premium;
  static const IconData location = Icons.location_on;
  static const IconData article = Icons.article;
  static const IconData profile = Icons.person;
  static const IconData signOut = Icons.exit_to_app;
  static const IconData time = Icons.access_time;
  static const IconData bus = Icons.directions_bus;
  static const IconData book = Icons.book;
  static const IconData payment = Icons.payment;
  static const IconData school = Icons.school;
  static const IconData file = Icons.insert_drive_file;
  static const IconData pdf = Icons.picture_as_pdf;
  static const IconData exam = Icons.assignment;
  static const IconData progress = Icons.analytics;
  static const IconData report = Icons.report;
  static const IconData results = Icons.leaderboard;
  static const IconData records = Icons.data_array;
  static const IconData check = Icons.check;
  static const IconData cross = Icons.close;
  static const IconData delete = Icons.delete;
  static const IconData alert = Icons.notifications_active;
  static const IconData trophy = Icons.workspace_premium;

  static IconData statusIcon(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return alert;
      case "approved":
        return check;
      case "rejected":
        return cross;
      case "cancelled":
        return delete;
      default:
        return Icons.help_outline;
    }
  }

  static IconData attendanceIcons(String status) {
    switch (status.toLowerCase()) {
      case "present":
        return Icons.check_outlined;
      case "absent":
        return Icons.close;
      case "late":
        return Icons.schedule;
      default:
        return Icons.help_outline;
    }
  }
}
