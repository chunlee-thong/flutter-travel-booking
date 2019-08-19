import 'package:flutter/material.dart';

class IconModel {
  IconData icon;
  bool isSelected;
  IconModel(this.icon, this.isSelected);
}

List<IconModel> icons = [
  IconModel(Icons.flight, false),
  IconModel(Icons.directions_car, true),
  IconModel(Icons.panorama, false),
  IconModel(Icons.motorcycle, false),
];
