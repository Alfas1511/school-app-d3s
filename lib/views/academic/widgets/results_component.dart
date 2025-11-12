import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/views/academic/widgets/listing_card_component.dart';
import 'package:school_app/components/section_title.dart';

class ResultsComponent extends StatelessWidget {
  const ResultsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Recent Results"),

        SizedBox(height: 10),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.pdf,
          title: "Mathematics",
          subtitle: "92/100 - Grade A+ - rank #3",
          tag: 'Mid-term Exam',
          color: Colors.green[50],
          trailingContent: "A+",
        ),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.file,
          title: "Science",
          subtitle: "88/100 - Grade A - rank #5",
          tag: 'Mid-term Exam',
          color: Colors.blue[50],
          trailingContent: "A",
        ),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.file,
          title: "English",
          subtitle: "88/100 - Grade A - rank #5",
          tag: 'Mid-term Exam',
          color: Colors.purple[50],
          trailingContent: "A+",
        ),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.file,
          title: "History",
          subtitle: "90/100 - Grade A - rank #1",
          tag: 'Mid-term Exam',
          color: Colors.orange[50],
          trailingContent: "A+",
        ),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.file,
          title: "Art",
          subtitle: "98/100 - Grade A+ - rank #1",
          tag: 'Mid-term Exam',
          color: Colors.blue[50],
          trailingContent: "A+",
        ),

        ListingCardComponent(
          cardTitle: "",
          icon: AppIcons.file,
          title: "Physical Education",
          subtitle: "85/100 - Grade A - rank #4",
          tag: 'Mid-term Exam',
          color: Colors.blue[50],
          trailingContent: "A",
        ),
      ],
    );
  }
}
