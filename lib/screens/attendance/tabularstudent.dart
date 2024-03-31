import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nmims_app/models/tabular_attendance_item_model.dart';

class Tabularstudent extends StatefulWidget {
  const Tabularstudent({Key? key}) : super(key: key);

  @override
  _TabularstudentState createState() => _TabularstudentState();
}

class _TabularstudentState extends State<Tabularstudent> {
  DateTime? startDate;
  DateTime? endDate;
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    final filteredAttendance = t_attendance.where((record) {
      if (startDate != null && endDate != null) {
        return record.date
                .isAfter(startDate!.subtract(const Duration(days: 1))) &&
            record.date.isBefore(endDate!.add(const Duration(days: 1)));
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tabular Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _datePickerButton(
                  context,
                  isStartDate: true,
                  label: startDate != null
                      ? DateFormat('dd/MM/yyyy').format(startDate!)
                      : 'Start Date',
                ),
                _datePickerButton(
                  context,
                  isStartDate: false,
                  label: endDate != null
                      ? DateFormat('dd/MM/yyyy').format(endDate!)
                      : 'End Date',
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: isvisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: filteredAttendance.length,
                itemBuilder: (context, index) {
                  final item = filteredAttendance[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          item.pa == 'P' ? Colors.green : Colors.red,
                      child: Text(item.pa,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(item.subject),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat('dd/MM/yyyy').format(item.date)),
                        Text(item.time),
                      ],
                    ),
                    isThreeLine: true,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _datePickerButton(BuildContext context,
      {required bool isStartDate, required String label}) {
    return OutlinedButton(
      onPressed: () => _pickDate(context, isStartDate: isStartDate),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.red),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.red)),
    );
  }

  Future<void> _pickDate(BuildContext context,
      {required bool isStartDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
        } else {
          endDate = pickedDate;
        }
        isvisible = startDate != null && endDate != null;
      });
    }
  }
}
