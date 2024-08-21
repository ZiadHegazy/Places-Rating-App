import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:places_rating/NavBar.dart';
import 'package:places_rating/PlaceModel.dart';
import 'package:places_rating/Places.dart';
import 'package:places_rating/Rating.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}
class _FavoriteState extends State<Favorite> {
  List<PlaceModel> allPlaces = [];

  @override
  void initState() {
    super.initState();
    allPlaces = [];
    loadPlaces();
  }

  void loadPlaces(){
    setState(() {
      allPlaces=Provider.of<Places>(context,listen: false).favoritePlaces;
    });

  }
  List<Widget> placesCards(){
    List<Widget> cards=[];
    for(int i=0;i<allPlaces.length;i++){
      cards.add(
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(allPlaces[i].image,width: 70,height: 70,cacheWidth: null,),
                      Text(allPlaces[i].name  ),
                      PopupMenuButton(itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: allPlaces[i].favorite? Text("Remove from Favorite"): Text("Add to Favorite"),
                            value: allPlaces[i].favorite? 'Remove from Favorite': 'Add to Favorite',
                          ),
                          if(!allPlaces[i].rated)
                            PopupMenuItem(
                              child: Text("Rate"),
                              value: 'Rate',
                            ) ,
                          PopupMenuItem(
                            child: Text("Delete"),
                            value: 'Delete',
                          )
                        ];
                      }, onSelected: (String value) {
                        if (value == 'Add to Favorite') {
                          Provider.of<Places>(context, listen: false).addToFavorite(allPlaces[i]);
                        } else if (value == 'Rate') {
                          Navigator.pushNamed(context, '/review',arguments: allPlaces[i]);
                        } else if (value == 'Delete') {
                          Provider.of<Places>(context, listen: false).deletePlace(allPlaces[i]);
                          loadPlaces();
                        } else if (value=='Remove from Favorite'){
                          Provider.of<Places>(context, listen: false).removeFromFavorite(allPlaces[i]);
                          loadPlaces();
                        }

                      },),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/parking.png",width: 25,height: 25),
                          Rating(value: allPlaces[i].parkingRating),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("assets/pavement.png",width: 25,height: 25),
                          Rating(value: allPlaces[i].pavementRating)
                        ],
                      )
                    ],)
                  ,SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/toilet.png",width: 25,height: 25),
                          Rating(value: allPlaces[i].toiletRating),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("assets/service.png",width: 25,height: 25),
                          Rating(value: allPlaces[i].serviceRating)
                        ],
                      )
                    ],)

                ],
              ),
            ),
          )
      );
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<Places>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:allPlaces.length==0? Center(child:Text("No Places Yet",style:TextStyle(fontSize: 25))):  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: placesCards()

              ,
            ),
          ),
        ),
        bottomNavigationBar: Navbar(index:2),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createPlace');
          },
          shape: CircleBorder(),
          child: const Icon(Icons.add,color: Colors.white,),
          backgroundColor: Color.fromRGBO(218, 3, 95, 1),

        )
    );
  }
}