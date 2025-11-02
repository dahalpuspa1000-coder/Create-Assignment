import 'package:flutter/material.dart';

class SubmittedTab extends StatelessWidget {
  const SubmittedTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final List<String> submittedAssignments = ["English Essay", "Physics Lab Report"];

    return ListView.builder(
      itemCount: submittedAssignments.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(submittedAssignments[index]),
            subtitle: const Text("Submitted"),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
          ),
        );
      },
    );
  }
}
