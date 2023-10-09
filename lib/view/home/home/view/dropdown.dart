import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod/riverpod_genel.dart';

class DropDown extends ConsumerStatefulWidget {
  const DropDown({super.key});

  @override
  ConsumerState createState() => _DropDownState();
}

class _DropDownState extends ConsumerState {
  List<String> values = [
    'Cari Kart',
    'Marsatmas',
    'Pomvardimas',
  ];
  String? dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = values.first;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: DropdownButton<String>(
              value: dropdownValue,
              disabledHint: Text("TABLO SEÇİNİZ"),
              iconSize: 30.0,
              iconEnabledColor: Colors.white,
              focusColor: Colors.white,
              borderRadius: const BorderRadius.all(Radius.zero),
              items: values.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  alignment: Alignment.center,
                  onTap: () {
                    //  debugPrint("merhaba mesut nasılsınnnnnnnnnn $value");

                    // values.indexOf(dropdownValue);
                  },
                  value: value,
                  child: Text(value,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
                ref
                    .read(showHello.notifier)
                    .change(value: values.indexOf(value!));

                /*  indexxx = values.indexOf(value!);
                debugPrint("indexxxxx: " + indexxx.toString()); */
                // value.indexOf(value);
                //debugPrint("indexxxxx:`${values.indexOf(value)}`");
                //viewmodel.index=values.indexOf(value);
                /*  viewmodel.setValue(value: viewmodel.values.indexOf(value!));
                      print("valueeeedropdown:`${viewmodel.index}`");  */
                //debugPrint(
                //  "indexOffff:`${viewmodel.setValue(value: viewmodel.values.indexOf(value))}`");
              },
            ),
          ),
        ),
      ),
    );
  }
}
