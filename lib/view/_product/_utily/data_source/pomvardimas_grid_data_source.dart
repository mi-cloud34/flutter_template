import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../home/pomvardimas/model/pomvardimas_model.dart';

class PomvardimasDataSource extends DataGridSource {
 PomvardimasDataSource({required List<Pomvardimas> pomvardimas}) {
    _pomvardimas = pomvardimas
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<double>(columnName: 'id', value: e.Id),
              DataGridCell<String>(columnName: 'varad', value: e.varad),
              DataGridCell<String>(columnName: 'saat', value: e.saat),
              DataGridCell<bool>(columnName: 'admin', value: e.admin),
            ]))
        .toList();
    debugPrint("cartttttttt: `${pomvardimas.map((e) => e.varad)}`");
    //debugPrint("cartt55555555: `${_cariCart.map((e) => e.getCells())}`");
  }

  List<DataGridRow> _pomvardimas = [];
  @override
  List<DataGridRow> get rows => _pomvardimas;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getBackgroundColor() {
      int index = _pomvardimas.indexOf(row);
      if (index % 2 == 0) {
        return Colors.lightGreen;
      } else {
        return Colors.white;
      }
    }

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
       
        color: getBackgroundColor(),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dataGridCell.value.toString(),
          style: const TextStyle(fontSize: 18),
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