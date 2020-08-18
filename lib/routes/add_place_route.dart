import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_features/providers/great_places.dart';
import 'package:native_features/widgets/image_input.dart';
import 'package:native_features/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceRoute extends StatefulWidget {
  static const routeName  = '/add-place';
  @override
  _AddPlaceRouteState createState() => _AddPlaceRouteState();
}

class _AddPlaceRouteState extends State<AddPlaceRoute> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if( _titleController.text.isEmpty || _pickedImage == null)return;
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new place'),),
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: 'Title'),
                          controller: _titleController,
                        ),
                      SizedBox(height: 10,),
                     ImageInput(_selectImage),
                      SizedBox(height: 10,),
                      LocationInput()
                    ],
                  ),
                )
              )
            ),
            RaisedButton.icon(color: Theme.of(context).accentColor,onPressed: _savePlace, icon: Icon(Icons.add), label: Text('Add place'), elevation: 0,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,)
          ],
        ) ,
      )
    );
  }
}
