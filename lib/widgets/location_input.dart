import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          height: 170, width: double.infinity, child: _previewImageUrl == null ?Text('No location choosen', textAlign: TextAlign.center,) :
          Image.network(_previewImageUrl, fit: BoxFit.cover,width: double.infinity,)
          ,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.location_on), label: Text('Current location'), textColor: Theme.of(context).primaryColor,),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map), label: Text('Select on Map'), textColor: Theme.of(context).primaryColor,),
          ],
        )
      ],
    );
  }
}
