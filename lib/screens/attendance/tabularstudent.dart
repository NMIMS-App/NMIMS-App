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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //     margin: EdgeInsets.only(top: 20,bottom: 20),
              //     decoration: BoxDecoration(
              //          color:Color.fromRGBO(113,113,112,1),
              //         borderRadius: BorderRadius.all(Radius.circular(8))
              //     ),
              //     width:((MediaQuery. of(context). size. width)/4.31),
              //     height:80,
              //     child:Center(
              //         child:Text('Subject', textAlign: TextAlign.center,style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.white,
              //           fontWeight: FontWeight.w600,
              //         ),))
              // ),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(113,113,112,1),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  width:((MediaQuery. of(context). size. width)/4.5),
                  height:80,
                  child:Align(
                      alignment: Alignment.center,
                      child:Text('Date', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  // decoration: BoxDecoration(
                  //   // color:Color.fromRGBO(113,113,112,1),
                  //     color: Color.fromRGBO(211,211,211,1),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black45,
                  //         blurRadius: 8.0, // soften the shadow
                  //         spreadRadius: 0.1, //extend the shadow
                  //
                  //       )
                  //     ],
                  //     borderRadius: BorderRadius.all(Radius.circular(8))
                  // ),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(113,113,112,1),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  width:((MediaQuery. of(context). size. width)/4.5),
                  height:80,
                  child:Center(
                      child:Text('Time', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(211,211,211,1),
                  //   borderRadius: BorderRadius.all(Radius.circular(8)),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.black45,
                  //       blurRadius: 8.0, // soften the shadow
                  //       spreadRadius: 0.1, //extend the shadow
                  //
                  //     )
                  //   ],
                  // ),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(113,113,112,1),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  width:((MediaQuery. of(context). size. width)/5),
                  height:80,
                  child:Center(
                      child:Text('P / A', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
            ],
          ),

          Visibility(
              visible: isvisible,
              child:Flexible(
                child: Center(
                  child: Container(
                    height:MediaQuery.of(context).size.height,
                    child: ListView.separated(itemBuilder: (context,index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: ((MediaQuery.of(context).size.height)/20)+8+75,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:15),
                              width: MediaQuery.of(context).size.width,
                              height: (MediaQuery.of(context).size.height)/20,
                              child:Text((t_attendance[index].subject), textAlign: TextAlign.center,style: TextStyle(
                                color:Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                // // color:Colors.blue,
                                // margin: EdgeInsets.only(top: 8),
                                // width:((MediaQuery. of(context). size. width)/4.31),
                                // height:90,
                                // child:Align(
                                // alignment: Alignment.center,
                                // child:Text((tabular[index][0]).toString(), textAlign: TextAlign.center,style: TextStyle(
                                // color:Colors.black,
                                // fontSize: 16,
                                // fontWeight: FontWeight.w600,
                                // ),))
                                // ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/4.5),
                                  //margin: EdgeInsets.only(top:15),
                                  height:50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black38,width: 1.4),
                                  ),
                                  child: Center(
                                    child:Text("${t_attendance[index].date.day}/${t_attendance[index].date.month}/${t_attendance[index].date.year}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/4.5),
                                  height:50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black38,width: 1.4),
                                  ),
                                  child: Center(
                                    child:Text(t_attendance[index].time.toString(),style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.center,),
                                  ),
                                ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/5),
                                  height:50,
                                  child: Center(
                                      child: Container(
                                          width: ((MediaQuery. of(context). size. width)/7),
                                          height:50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            border: Border.all(color: t_attendance[index].pa=='P'?Colors.black:Colors.red ,width: 3.5),
                                          ),
                                          child: Center(
                                            child:Text(t_attendance[index].pa,style: TextStyle(
                                              color: t_attendance[index].pa=='P'? Colors.black : Colors.red,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          )
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                      itemCount: t_attendance.length,
                      separatorBuilder: (context,index){
                        return Divider(thickness: 1);
                      },
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
