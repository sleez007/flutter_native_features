import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:native_features/providers/great_places.dart';
import 'package:native_features/routes/add_place_route.dart';
import 'package:native_features/routes/places_list_route.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: GreatPlaces() ),
    ],
    child: DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness)=>ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
      ),
      themedWidgetBuilder: (context, theme){
          return MaterialApp(
            title: 'Great Places',
            theme: theme,
            routes: {
              '/' :(_)=> PlacesListRoute(),
              AddPlaceRoute.routeName : (_)=> AddPlaceRoute()
            },
          );
      },
    )
    );
  }
}




