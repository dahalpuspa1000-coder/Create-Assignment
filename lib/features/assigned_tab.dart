import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_color.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/get_subject_createassignment.dart';
import 'package:provider_test/features/provider/assignment_provider.dart';

class Assigned extends StatefulWidget {
  const Assigned({super.key});

  @override
  State<Assigned> createState() => _AssignedState();
}

class _AssignedState extends State<Assigned> {
  @override
  void initState() {
   Future.microtask(() => getAssignments());
    super.initState();
  }

  void getAssignments() async {
    final assignmentProvider = Provider.of<AssignmentProvider>(
      context,
      listen: false,
    );
    await assignmentProvider.getAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<AssignmentProvider>(
          builder: (context, assignmentProvider, child) => Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: searchstr,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.tune, color: Colors.grey),
                      onPressed: () {
                        // Add your filter logic here
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: assignmentProvider.assignmentList.length,
                  itemBuilder: (context, index) {
                    final item = assignmentProvider.assignmentList[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Faculty: ${item.faculty}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Semester: ${item.semester}"),
                              Text("Subject: ${item.subject?.name}"),
                              Text("Description: ${item.description}"),
                              Text("Deadline: ${item.deadline}"),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit, color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer<AssignmentProvider>(
        builder: (context, value, child) => 
        value.role=="teacher"||value.role=="admin"?FloatingActionButton(
          onPressed: () {
           Navigator.push(
             context,
            MaterialPageRoute(builder: (context) =>(GetSubject())),
            );
          },
          backgroundColor: primarycolor,
          child: Icon(Icons.add, color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ):SizedBox()
      ),
    );
  }
}
