import 'package:flutter/material.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/assigned_tab.dart';
import 'package:provider_test/features/feature.dart';
class HomeProvider extends ChangeNotifier {
//jpt
  List<Story> featureList = [
    Story(
      featureName: assignmentstr,
      featureIcon: Icons.assignment_outlined,
      destination: Assigned(),
    ),
    Story(featureName: logBookLabel, featureIcon: Icons.book_outlined),
    Story(featureName: courseLabel, featureIcon: Icons.subject_outlined),
    Story(featureName: resultLabel, featureIcon: Icons.description_outlined),
    Story(
      featureName: notificationLabel,
      featureIcon: Icons.notifications_outlined,
     // destination: LoginPage(),
    ),
    Story(
      featureName: profileLabel,
      featureIcon: Icons.person_outline,
      //destination: SignupPage(),
    ),
  ];
}