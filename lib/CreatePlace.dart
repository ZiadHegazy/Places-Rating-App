import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places_rating/PlaceModel.dart';
import 'package:places_rating/Places.dart';
import 'package:provider/provider.dart';
class CreatePlace extends StatefulWidget{
  @override
  CreatePlaceState createState() => CreatePlaceState();

}
class CreatePlaceState extends State<CreatePlace>{
  String name="";
  String image="";

  void handleAddPlace(BuildContext context){

    final Places places=Provider.of<Places>(context,listen: false);

    places.addPlace(PlaceModel(name: name,image: image,parkingRating: 0,serviceRating: 0,pavementRating: 0,toiletRating: 0,rated: false,favorite: false));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Place is created successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create Place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("Place Information",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20),
              TextField(
                onChanged: (value){
                  setState(() {
                    name=value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Name",
                  filled: true,
                  fillColor: Colors.white,
                    border: OutlineInputBorder( borderRadius:BorderRadius.circular(15))
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value){
                  setState(() {
                    image=value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Image",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder( borderRadius:BorderRadius.circular(15))
                ),
              ),
              SizedBox(height: 50,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(onPressed: name!="" && image!=""?  (){handleAddPlace(context);}:null, child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:Color.fromRGBO(218, 3, 95, 1),
                    foregroundColor: Colors.white,

                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                ),

              ))

            ],
          ),
        ),
      ),
    );
  }
}