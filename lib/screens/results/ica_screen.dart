import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nmims_app/models/ica_item_model.dart';

class ICAScreen extends StatefulWidget {
  const ICAScreen({super.key});

  @override
  State<StatefulWidget> createState() => ICAPageState();
}

class ICAPageState extends State<ICAScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ICA Marks",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: screenWidth,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(231, 126, 132, 0.7),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(CupertinoIcons.search),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 17, 30, 0),
                      child: SizedBox(
                          width: screenWidth - 150,
                          height: screenHeight - 600,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Search',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(Icons.filter_alt),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Color textColor = ica[index].icaStatus == "PASS"
                      ? Colors.green
                      : Colors.red;
                  Color boxColor = ica[index].icaStatus == "PASS"
                      ? CupertinoColors.systemGrey6
                      : const Color.fromRGBO(250, 227, 229, 1);
                  //  Color.fromRGBO(230, 252, 234, 1) for Green 232, 235, 234
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Visibility(
                            visible: ica[index].icaVisibility,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: SizedBox(
                                height: 100,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            CupertinoColors.systemGrey5,
                                        elevation: 7,
                                        shadowColor: Colors.grey,
                                        side: const BorderSide(
                                            color: Colors.red, width: 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {
                                      if (ica[index].icaVisibility == true) {
                                        ica[index].icaVisibility = false;
                                        setState(() {});
                                      } else if (ica[index].icaVisibility ==
                                          false) {
                                        ica[index].icaVisibility = true;
                                        setState(() {});
                                      }

                                      // print(details[index][3]);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          ica[index].icaCourse.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.red),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Marks: ${ica[index].icaTotal}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              ica[index].icaStatus,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Visibility(

                              // visible: details[index][3].toString()=="false"?true:false,
                              visible: !ica[index].icaVisibility,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    ica[index].icaVisibility = true;
                                    setState(() {});
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor: boxColor,
                                    elevation: 12,
                                    shadowColor: Colors.grey,
                                    side:
                                        const BorderSide(color: Colors.red, width: 1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Text(
                                          ica[index].icaCourse.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.fade),
                                        ),
                                      ),
                                      Text(
                                        "Semester: ${ica[index].icaSemester}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        "Year: ${ica[index].icaYear}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Text(
                                              "M-1 Marks: ${ica[index].icaM1}/10",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Text(
                                              "M-2 Marks: ${ica[index].icaM2}/10",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Term Work: ${ica[index].icaTermWork}/30",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "Total Marks: ${ica[index].icaTotal}/50",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ica[index].icaStatus,
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: ica.length,
              ),
            ),
          ],
        ));
  }
}
