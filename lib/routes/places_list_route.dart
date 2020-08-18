import 'package:flutter/material.dart';
import 'package:native_features/providers/great_places.dart';
import 'package:native_features/routes/add_place_route.dart';
import 'package:provider/provider.dart';

class PlacesListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Places'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: ()=>Navigator.of(context).pushNamed(AddPlaceRoute.routeName)
        )
      ],),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces() ,
        builder: (ctx, snapshot)=>snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) :Consumer<GreatPlaces>(
          child: Center(
            child: Text('Got no places yet, start adding some!'),
          ),
          builder: (context,greatPlaces,ch){
            return greatPlaces.items.length <= 0 ? ch : ListView.builder(itemBuilder:(ctx, i)=>ListTile(
              leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image),),
              title: Text(greatPlaces.items[i].title),
              onTap: (){},
            ), itemCount: greatPlaces.items.length, );
          },
        ),

      )
    );
  }
}
