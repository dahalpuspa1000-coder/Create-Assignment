import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/assigned_tab.dart';
import 'package:provider_test/features/provider/signup_provider.dart';
import 'package:provider_test/features/submitted_tab.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, signupProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
            title:  Text(assignmentstr),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(icon: Icon(Icons.assignment), text: "Assigned"),
                Tab(icon: Icon(Icons.assignment_turned_in), text: "Submitted"),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
               Assigned(),
                SubmittedTab(),
            ],
          ),
        );
      },
    );
  }
}


