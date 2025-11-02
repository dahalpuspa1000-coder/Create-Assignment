import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/features/test/pages/test_pages_provider.dart';
class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _HomepageState();
}

class _HomepageState extends State<Testpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) =>
         Column(
          children: [
          Text("${testProvider.a}",style: TextStyle(color: Colors.green),),
          Row(
            children: [
              ElevatedButton(onPressed: (){
                testProvider.increaseValue();
              }, child: Text(addlsble)),
               ElevatedButton(onPressed: (){
                testProvider.decreasevalue();
              }, child: Text(sublable))
            ],
            
          ),  
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: (){
                testProvider.showpassword();
              }, icon: Icon(
                testProvider.passwordvisibility? Icons.visibility:
                Icons.visibility_off),),
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}