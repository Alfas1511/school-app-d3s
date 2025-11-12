import 'package:flutter/material.dart';
import 'package:school_app/views/privacyPolicy/agreement_card.dart';
import 'package:school_app/views/privacyPolicy/contact_us_card.dart';
import 'package:school_app/views/privacyPolicy/data_retention_card.dart';
import 'package:school_app/views/privacyPolicy/data_security_card.dart';
import 'package:school_app/views/privacyPolicy/information_collect_card.dart';
import 'package:school_app/views/privacyPolicy/information_sharing_card.dart';
import 'package:school_app/views/privacyPolicy/information_use_card.dart';
import 'package:school_app/views/privacyPolicy/introduction_card.dart';
import 'package:school_app/views/privacyPolicy/terms_of_sevice_card.dart';
import 'package:school_app/views/privacyPolicy/your_rights_card.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF473cd3), Color(0xFFF473cd3)],
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
            Text("Back to More", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFF473cd3),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Last Updated: January 15, 2024",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  IntroductionCard(),

                  SizedBox(height: 10),

                  InformationCollectCard(),

                  SizedBox(height: 10),

                  InformationUseCard(),

                  SizedBox(height: 10),

                  InformationSharingCard(),

                  SizedBox(height: 10),

                  DataSecurityCard(),

                  SizedBox(height: 10),

                  YourRightsCard(),

                  SizedBox(height: 10),

                  TermsOfSeviceCard(),

                  SizedBox(height: 10),

                  // Data Retention Section
                  DataRetentionCard(),

                  SizedBox(height: 10),

                  // Contact Us Section
                  ContactUsCard(),

                  SizedBox(height: 10),

                  // Agreement Section
                  AgreementCard(),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
