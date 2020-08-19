import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:native_features/helpers/db_helper.dart';
import 'package:native_features/model/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace( String title, File image ){
    final newPlace = Place(id: DateTime.now().toString(), title: title,image: image, location: PlaceLocation(latitude: 34455,longitude: 57757, address: 'Eke Awka'));
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path});
  }

  Future<void> fetchAndSetPlaces() async{
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((item)=>Place(id: item['id'], title: item['title'], image:File(item['image']) , location: null)).toList();
    notifyListeners();
  }
}