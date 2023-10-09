import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../riverpod/riverpod_genel.dart';
import '../../caricart/view/caricart_view.dart';
import '../../marsatmas/view/marsatmas_view.dart';
import '../../pomvardimas/view/pomvardimas_view.dart';

class ViewPage extends ConsumerStatefulWidget {
  const ViewPage({super.key});

  @override
  ConsumerState createState() => _ViewPageState();
}

class _ViewPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    int indexx = ref.watch(showHello);
    if (indexx != 0) {
      setState(() {
        ref.read(queryIdProvider.notifier).state = 0;
      });
    }
    //ref.read(queryIdProvider.notifier).state = 0;
    return Center(
      child: Expanded(
        child: Container(
            child: indexx == 0
                ? CariCartView()
                : indexx == 1
                    ? MarsatmasView()
                    : indexx == 2
                        ? const PomvardimasView()
                        : const SizedBox()),
      ),
    );
  }
}
