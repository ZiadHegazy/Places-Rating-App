import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,

              decoration: BoxDecoration(
                // color: Color.fromRGBO(121, 127, 151, 1),



              ),
              child: Center(
                child:Text("Welcome",style: TextStyle(fontSize: 20),)
              ),
            ),
            ElevatedButton(onPressed: ()=>{Navigator.pushNamed(context, "/home")}, child: Text("Get Started"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(218, 3, 95, 1),
                  foregroundColor: Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width*0.6, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            )
          ],
        )
      ),
    );
  }
}