import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'studentlist.dart';

class TeacherAttendance extends StatefulWidget {
  const TeacherAttendance({super.key});

  @override
  State<StatefulWidget> createState() => TeacherAttendanceState();
}

class TeacherAttendanceState extends State<TeacherAttendance> {
  var subjects = [
    "Mobile Application Development",
    "Software Engineering",
    "Operating Systems"
  ];
  var courses = [
    "BTech Computers Semester 2",
    "BTech Cyber Security Semester 5",
    "BTech Computers Semester 3",
    "BTech Computers Semester 4"
  ];
  var times = ["10:00am - 11:00am", "11:00am - 12:00pm", "9:00am - 10:00am"];
  String date = "Select Date";
  String? subject;
  String? course;
  String? time;
  double isvisible = 0;

  // void navigateToStudentList(BuildContext ctx){
  //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
  //     return StudentList(course,subject,date,time);
  //   }));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teacher Attendance"),
        ),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        hint: const Text("Enter Course"),
                        value: course,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        items: courses.map((String vals) {
                          return DropdownMenuItem(
                            value: vals,
                            child: Text(vals,
                                style: const TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (String? newcourse) {
                          setState(() {
                            course = newcourse!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      width: 300,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(211, 211, 211, 1),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Center(
                        child: Container(
                          height: 90,
                          margin: const EdgeInsets.all(10),
                          child: DropdownButton<String>(
                            alignment: Alignment.center,
                            hint: const Text("Select Subject"),
                            value: subject,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: subjects.map((String vals) {
                              return DropdownMenuItem(
                                value: vals,
                                child: Text(
                                  vals,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newval) {
                              setState(() {
                                subject = newval!;
                              });
                            },
                          ),
                        ),
                      )),
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 211, 211, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: date == "Select Date"
                              ? const EdgeInsets.only(left: 90)
                              : const EdgeInsets.only(left: 10),
                          child: Text(
                            date,
                            style: TextStyle(
                              color: date == "Select Date"
                                  ? Colors.black54
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: date == "Select Date"
                              ? const EdgeInsets.only(left: 60)
                              : const EdgeInsets.only(left: 150),
                          child: IconButton(
                              onPressed: () async {
                                DateTime? d = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(2024));

                                if (d != null) {
                                  date = "${d.day}/${d.month}/${d.year} ";
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.calendar_today_outlined,
                                  size: 35, color: Colors.black45)),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(211, 211, 211, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    width: 300,
                    height: 80,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: DropdownButton(
                          alignment: Alignment.center,
                          isExpanded: true,
                          hint: const Text("Select Time"),
                          value: time,
                          items: times.map((String vals) {
                            return DropdownMenuItem(
                                value: vals, child: Text(vals));
                          }).toList(),
                          onChanged: (String? newtime) {
                            time = newtime!;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: isvisible,
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Text(
                      "Please select all details",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      if ((subject != null) &&
                          (course != null) &&
                          (time != null) &&
                          (date != "Select Date")) {
                        // navigateToStudentList(context);
                      } else {
                        isvisible = 1;
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    child: const Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
