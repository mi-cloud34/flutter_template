import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/view/home/caricart/model/model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CariCartDataSource extends DataGridSource {
  CariCartDataSource({required List<CariCart> caricart}) {
    _cariCart = caricart
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<double>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'ad', value: e.ad),
              DataGridCell<String>(columnName: 'soyad', value: e.soyad),
              DataGridCell<String>(columnName: 'drm', value: e.drm),
              DataGridCell<String>(columnName: 'unvan', value: e.unvan),
              DataGridCell<String>(columnName: 'ilgili', value: e.ilgili),
              DataGridCell<int>(columnName: 'grp1', value: e.grp1),
            ]))
        .toList();
    debugPrint("cartttttttt: `${caricart.map((e) => e.ad)}`");
    //debugPrint("cartt55555555: `${_cariCart.map((e) => e.getCells())}`");
  }

  List<DataGridRow> _cariCart = [];
  @override
  List<DataGridRow> get rows => _cariCart;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    /*  Gradient getBackgroundColor() {
      int index = _cariCart.indexOf(row);
      if (index % 2 == 0) {
        return LinearGradient(colors: [Colors.white, Colors.amber]);
      } else {
        return LinearGradient(colors: [Colors.white, Colors.green]);
      }
    } */
    Color getBackgroundColor() {
      int index = _cariCart.indexOf(row);
      if (index % 2 == 0) {
        return Colors.lightBlue;
      } else {
        return Colors.white;
      }
    }

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
    
        //decoration: BoxDecoration(gradient: getBackgroundColor()),
        color: getBackgroundColor(),
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          child: Text(
            dataGridCell.value.toString(),
            style: TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }).toList());
  }
}





 /* void buildDataGrid(List<CariCart> cartData) =>_cariData= cartData.map<DataGridRow>(
        (cart) => DataGridRow(
          cells: CariCartColumns.values
              .map(
                (columnn) => DataGridCell<CariCart>(
                    columnName: columnn.toString(), value: cart),
              )
              .toList(),
        ),
      ).toList(); */