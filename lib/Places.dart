import 'package:flutter/material.dart';
import 'package:places_rating/PlaceModel.dart';

class Places with ChangeNotifier {
  List<PlaceModel> _places = [PlaceModel(name: "GUC", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3pSxZXJlEJqyM1tzZXqJXl28X4sFVMmsW9Q&s", parkingRating: 1, serviceRating: 2, pavementRating: 1, toiletRating: 3,rated: true,favorite: true)];

  List<PlaceModel> get places => _places;

  List<PlaceModel> get favoritePlaces => _places.where((element) => element.favorite).toList();

  void addPlace(PlaceModel place) {
    _places.add(place);
    notifyListeners();
  }
  void deletePlace(PlaceModel place) {
    _places.remove(place);
    notifyListeners();
  }
  void addToFavorite(PlaceModel place) {
    place.favorite=true;
    notifyListeners();
  }
  void removeFromFavorite(PlaceModel place) {
    place.favorite=false;
    notifyListeners();
  }
  void ratePlace(PlaceModel place,int parkingRating,int serviceRating,int pavementRating,int toiletRating) {
    place.parkingRating=parkingRating;
    place.serviceRating=serviceRating;
    place.pavementRating=pavementRating;
    place.toiletRating=toiletRating;
    place.rated=true;
    notifyListeners();
  }
}
