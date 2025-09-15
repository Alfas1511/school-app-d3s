import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String selectedChild = "Emma Johnson - Grade 5A";

  String selectedDay = "Monday";
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];

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
              "Timetable",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Emma Johnson - Grade 5A",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Day",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        final day = days[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(day),
                            selected: selectedDay == day,
                            onSelected: (selected) {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            selectedColor: const Color(0xFF6A11CB),
                            labelStyle: TextStyle(
                              color: selectedDay == day
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
            ),

            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monday Schedule",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("8/9/2025"),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("08:00 - 08:45"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mathematics",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Mrs. Smith"),
                              ],
                            ),
                            Text("Room 285"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("08:45 - 09:30"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "English",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Mrs. Johnson"),
                              ],
                            ),
                            Text("Room 101"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          decoration: BoxDecoration(color: Colors.orange[200]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("09:30 - 09:45"),
                              Icon(Icons.schedule, color: Colors.purple),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Break",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(""),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("09:45 - 10:30"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Science",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Ms. Davis"),
                              ],
                            ),
                            Text("Room 302"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("10:30 - 11:15"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "History",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Mrs. Wilson"),
                              ],
                            ),
                            Text("Room 285"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("11:15 - 12:00"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Art",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Mr. Brown"),
                              ],
                            ),
                            Text("Art Room"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          decoration: BoxDecoration(color: Colors.orange[200]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("12:00 - 01:00"),
                              Icon(Icons.schedule, color: Colors.purple),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lunch",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(""),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1:00 - 01:45"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Physical Education",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Mr. Garcia"),
                              ],
                            ),
                            Text("Gym"),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("01:45 - 02:30"),
                            Icon(Icons.file_copy, color: Colors.purple),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Music",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Ms. Taylor"),
                              ],
                            ),
                            Text("Music Room"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height:12),

            Padding(
                padding: EdgeInsets.all(12.00),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Today's Highlights",
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.science, color: Colors.blue,),
                        title: Text("Science Lab", style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Experiment on plant growth - bring notebook"),
                      ),
                      ListTile(
                        leading: Icon(Icons.sports_gymnastics, color: Colors.blue,),
                        title: Text("PE Class", style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Swimming practice - bring swimmer"),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
