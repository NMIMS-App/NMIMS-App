import 'package:flutter/material.dart';
import 'package:nmims_app/models/ica_item_model.dart'; // Import your model here

class ICAScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ICAScreenState();
}

class _ICAScreenState extends State<ICAScreen> {
  List<ICA> icaItems = ica;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ICA Marks",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 60,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.redAccent),
                      onPressed: () {
                        // Implement search functionality
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.redAccent),
                      onPressed: () {
                        // Implement filter functionality
                      },
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: icaItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ExpansionTile(
                      iconColor: Colors.redAccent,
                      collapsedIconColor: Colors.redAccent,
                      title: Text(
                        icaItems[index].icaCourse ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Semester: ${icaItems[index].icaSemester}",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Year: ${icaItems[index].icaYear}",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "M-1 Marks: ${icaItems[index].icaM1}/10",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Text(
                                    "M-2 Marks: ${icaItems[index].icaM2}/10",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Term Work: ${icaItems[index].icaTermWork}/30",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Text(
                                    "Total Marks: ${icaItems[index].icaTotal}/50",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Status: ${icaItems[index].icaStatus}",
                                style: TextStyle(
                                  color: icaItems[index].icaStatus == "PASS" ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
