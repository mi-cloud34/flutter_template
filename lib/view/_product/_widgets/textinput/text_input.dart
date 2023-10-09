import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/core/init/network/vexana_manager.dart';
import 'package:flutter_architecture/view/_product/_utily/data_source/caricart_grid_data_source.dart';
import 'package:flutter_architecture/view/home/caricart/service/ICaricartService.dart';
import 'package:flutter_architecture/view/home/caricart/service/caricart_service.dart';
import 'package:flutter_architecture/view/riverpod/riverpod_genel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeInput extends ConsumerStatefulWidget {
  final String? text;
  const HomeInput({super.key, this.text});

  @override
  ConsumerState createState() => _HomeInputState();
}

class _HomeInputState extends ConsumerState {
  final key = GlobalKey();
   ICariCartService? _cariCartService;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void initState() {
    super.initState();
    _cariCartService =
        CariCartService(VexanaManager.instance.networkManager, scaffoldState);
  }

  Future<CariCartDataSource?>? _cariCartDataSource;
  Future<CariCartDataSource?>? fetchCariCart() {
    _cariCartDataSource = _cariCartService!.getAll(ref: ref);
    return _cariCartDataSource;
  }
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      height: 70,
      margin: const EdgeInsets.all(15),
      child: TextField(
        controller: _textEditingController,
        maxLength: 20,
        style: const TextStyle(color: Colors.white),
        /*  onChanged:(value) {
          value.characters.map((e) => widget.text);
        }, */
        buildCounter: (BuildContext context,
            {int? currentLength, bool? isFocused, int? maxLength}) {
          return _animatedContainer(currentLength);
        },
        /*  onTap: () {
          setState(() {
            //debugPrint("inputTappp:`${_search}`");
            ref.read(dataGridProvider.notifier).loadCartData(
                value: ref.read(textFieldProvider.notifier).state);
          });
        },
 */
        onChanged: (value) {
          setState(() {
            ref.read(textFieldProvider.notifier).state = value;
            debugPrint(
                "inputttttt:`${ref.read(textFieldProvider.notifier).state}`");
            // ref.read(dataGridProvider.notifier).loadCartData(
            //    value: ref.read(textFieldProvider.notifier).state);
          });
        },
        keyboardType: TextInputType.text,
        //autofocus: true,
        //autofillHints: const [AutofillHints.se],
        // focusNode: focusNodeTextFieldOne,
        // inputFormatters: [TextProjectInputFormmater()._formmatter],
        //textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                //("xxx:`${ref.read(textFieldProvider.notifier).state}`");
               /*  setState(() {
                  ref.watch(dataGridProvider.notifier).loadCartData(
                      value: ref.read(textFieldProvider.notifier).state);
                }); */
              },
              icon: const Icon(Icons.search),
              iconSize: 50,
            ),
            //prefixIcon: Icon(Icons.sea,srch),
            hintText: "Arama Yapınız",
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
            ),
            border:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            labelText: 'Search',
            labelStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white,
            focusColor: Colors.white,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            suffixIconColor: Colors.white),
      ),
    ));
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: key,
      duration: const Duration(seconds: 1),
      height: 5,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.white,
    );
  }
}

/* class TextProjectInputFormmater {
  final _formmatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    }
    return oldValue;
  });
} */

class InputDecarotor {
  final serachInput = const InputDecoration(

      //prefixIcon: Icon(Icons.search),
      hintText: "Arama Yapınız",
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 0.0),
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelText: 'Search',
      labelStyle: TextStyle(color: Colors.white),
      fillColor: Colors.white,
      focusColor: Colors.white,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      prefixIconColor: Colors.white);
}
