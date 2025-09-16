import "package:flutter/material.dart";

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  String selectedDepartment = "Education";
  final List<String> departments = [
    "Education",
    "Finance",
    "Transport",
    "Cultural",
    "Health",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color(0xFFF8B2CDF),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF0f7b72), Color(0xFFF0f7b72)],
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
              color: Color(0xFFF0f7b72),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact School",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Get in touch with School Administration",
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Quick Contact",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            child: ListTile(
                              leading: Icon(
                                Icons.apartment,
                                color: Colors.blue,
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.call, color: Colors.lightGreen),
                                  Icon(Icons.mail, color: Colors.lightBlue),
                                ],
                              ),
                              title: Text(
                                "Main Office",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.call, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "+1 (555) 123-4567",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.mail, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "office@abcschool.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "Mon-Fri 08:00AM - 04:00PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Container(
                            color: Colors.grey[200],

                            child: ListTile(
                              leading: Icon(
                                Icons.apartment_rounded,
                                color: Colors.blue,
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.call, color: Colors.lightGreen),
                                  Icon(Icons.mail, color: Colors.lightBlue),
                                ],
                              ),
                              title: Text(
                                "Academic Office",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.call, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "+1 (555) 123-4567",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.mail, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "office@abcschool.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "Mon-Fri 08:00AM - 04:00PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Container(
                            color: Colors.grey[200],
                            child: ListTile(
                              leading: Icon(
                                Icons.bus_alert,
                                color: Colors.blue,
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.call, color: Colors.lightGreen),
                                  Icon(Icons.mail, color: Colors.lightBlue),
                                ],
                              ),
                              title: Text(
                                "Transport Department ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.call, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "+1 (555) 123-4567",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.mail, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "office@abcschool.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "Mon-Fri 08:00AM - 04:00PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Container(
                            color: Colors.grey[200],

                            child: ListTile(
                              leading: Icon(Icons.money, color: Colors.blue),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.call, color: Colors.lightGreen),
                                  Icon(Icons.mail, color: Colors.lightBlue),
                                ],
                              ),
                              title: Text(
                                "Accounts & Fees",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.call, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "+1 (555) 123-4567",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.mail, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "office@abcschool.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule, size: 15),
                                      SizedBox(width: 8),
                                      Text(
                                        "Mon-Fri 08:00AM - 04:00PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Send a Message",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Department",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        value: selectedDepartment,
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        items: departments
                                            .map(
                                              (child) => DropdownMenuItem(
                                                value: child,
                                                child: Text(child),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDepartment = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Subject",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "Enter subject",
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Message",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      const TextField(
                                        maxLines: 4,
                                        decoration: InputDecoration(
                                          hintText: "Type your message here..",
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "0/500 characters",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      // Submit Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            backgroundColor: const Color(
                                              0xFFF0f7b72,
                                            ),
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text("Message Send successfully!"),
                                                duration: Duration(seconds: 2),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "Send Message",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Visit Us",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text(
                                  "Springfield Elementary School",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("123 Education Street"),
                                    Text("Springfield, ST 12345"),
                                    Text("United States"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
