import 'package:flutter/material.dart';
import 'package:flutter_architecture/view/home/marsatmas/model/marsatmas_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MarsatmasDataSource extends DataGridSource {
  MarsatmasDataSource({required List<MarsatMas> marsatmas}) {
    _marsatmas = marsatmas
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<double>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'islmtipad', value: e.islmtipad),
              DataGridCell<String>(columnName: 'yerad', value: e.yerad),
              DataGridCell<String>(columnName: 'cartip', value: e.cartip),
            ]))
        .toList();
    debugPrint("cartttttttt: `${marsatmas.map((e) => e.cartip)}`");
    //debugPrint("cartt55555555: `${_cariCart.map((e) => e.getCells())}`");
  }

  List<DataGridRow> _marsatmas = [];
  @override
  List<DataGridRow> get rows => _marsatmas;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color? getBackgroundColor() {
      int index = _marsatmas.indexOf(row);
      if (index % 2 == 0) {
        return Colors.red[200];
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