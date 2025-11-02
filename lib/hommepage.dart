import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            homestr,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HomeProvider>(
            builder: (context, homeProvider, child) => Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: homeProvider.featureList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = homeProvider.featureList[index];

                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: InkWell(
                          onTap: () {
                            if (item.destination != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => item.destination!,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(item.featureIcon, size: 30),
                                  const SizedBox(height: 5),
                                  Text(
                                    homeProvider
                                        .featureList[index]
                                        .featureName!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}