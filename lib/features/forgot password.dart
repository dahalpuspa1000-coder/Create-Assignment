import 'package:flutter/material.dart';

class Forgotpassword
 extends StatelessWidget {
  const Forgotpassword
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    leading:IconButton(onPressed: (

    ){
//Navigator.pop(context,MaterialPageRoute(builder: (context)=>()));
    }, icon:Icon(Icons.arrow_back_ios))
      ),
        
      
    
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password",style: TextStyle(fontSize: 30)),
            SizedBox(
            
            ),
            Text("Please enter your email"),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Email address",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        Expanded(
          child: SizedBox(
          
          ),
        ),
       
       Row(
                children: [
              Expanded(
                child: ElevatedButton(onPressed: (){}, 
                style:ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor:Colors.red [700],shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                ),
                child: Text("Login"),
              ),
                
               
              ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
          ],
      )
        
        ),
      );
      
  
  }
}