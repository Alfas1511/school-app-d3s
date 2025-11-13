import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class LeaveType {
  final int id;
  final String name;

  LeaveType({required this.id, required this.name});
}

class LeaveFormCard extends StatefulWidget {
  final List<LeaveType>? leaveTypes;

  const LeaveFormCard({super.key, this.leaveTypes});

  @override
  State<LeaveFormCard> createState() => _LeaveFormCardState();
}

class _LeaveFormCardState extends State<LeaveFormCard> {
  int? selectedLeaveTypeId;
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController reasonController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final leaveTypes = widget.leaveTypes ?? [];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Submit Leave Request"),
          const SizedBox(height: 15),

          // Leave Type
          const Text(
            "Leave Type",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          if (leaveTypes.isEmpty)
            const Text("No leave types available.")
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3.5,
              ),
              itemCount: leaveTypes.length,
              itemBuilder: (context, index) {
                final leaveType = leaveTypes[index];
                final isSelected = selectedLeaveTypeId == leaveType.id;
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: isSelected
                        ? const Color(0xFF6A11CB)
                        : Colors.white,
                    side: BorderSide(
                      color: isSelected ? const Color(0xFF6A11CB) : Colors.grey,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedLeaveTypeId = leaveType.id;
                    });
                  },
                  child: Text(
                    leaveType.name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),

          const SizedBox(height: 20),

          // Start Date & End Date
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: _DateField(
                    label: "Start Date",
                    value: startDate != null
                        ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                        : "-/-/-",
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: _DateField(
                    label: "End Date",
                    value: endDate != null
                        ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                        : "-/-/-",
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Reason for Leave
          const Text(
            "Reason for Leave",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: reasonController,
            maxLines: 4,
            maxLength: 500,
            decoration: const InputDecoration(
              hintText: "Please provide details about your leave request...",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFF6A11CB),
              ),
              onPressed: () {
                if (selectedLeaveTypeId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a leave type."),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                if (startDate == null || endDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select both start and end dates."),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                if (reasonController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a reason for leave."),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Leave submitted successfully!"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Submit Leave",
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
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final String value;

  const _DateField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontSize: 14)),
              const Icon(Icons.calendar_today, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
