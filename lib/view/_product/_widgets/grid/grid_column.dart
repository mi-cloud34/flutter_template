import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

GridColumn gridColumnData(String columnText, String text,
    {double widht = 150, double padding = 8.0}) {
  return GridColumn(
      columnName: columnText,
      label: Card(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          //alignment: Alignment.centerRight,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ));
}
