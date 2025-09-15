import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color(0xFFF8B2CDF),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF8B2CDF), Color(0xFFF8B2CDF)],
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
              "Back to More",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFF8B2CDF),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text("Notifications", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                      Text("2 unread notifications", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,)),
                      ],
                    ),
                    ElevatedButton(onPressed: (){}, 
                      child: Text("Mark All Read")),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 12),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){},
                        child: Text("All(6)")
                    ),
                    ElevatedButton(onPressed: (){},
                        child: Text("Academic(2)")
                    ),
                    ElevatedButton(onPressed: (){},
                        child: Text("Transport(1)")
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(-5, 0))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 👈 align to top
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 10), // spacing
                      Expanded( // 👈 makes Column take remaining space & allow wrapping
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // left align text
                          children: [
                            const Text(
                              "Math Assignment Due Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Please complete Chapter 5 exercises (Questions 1-15) and submit by 9:00 AM",
                              softWrap: true, // 👈 ensures wrapping
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("2 hours ago",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("View Details",
                                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}


