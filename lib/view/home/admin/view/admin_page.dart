import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';

import 'package:flutter_architecture/view/home/caricart/view/caricart_view.dart';
import 'package:flutter_architecture/view/home/marsatmas/view/marsatmas_view.dart';
import 'package:flutter_architecture/view/home/pomvardimas/view/pomvardimas_view.dart';
import 'package:flutter_architecture/view/riverpod/riverpod_genel.dart';
import 'package:flutter_architecture/view/riverpod/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState with TickerProviderStateMixin {
  late final TabController _tabController;
  int? id;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getValue();
  }

  Future<SharedPreferences?> getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getInt("id");
    setState(() {
      ref.read(queryIdProvider.notifier).state = id!;
    });
    debugPrint("adminidddddddddd:`$id`");
    return pref;
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userrProvider.notifier);
    inspect(user.state.ad);
    inspect(user.state.mail);
    debugPrint("useradminnnnnnnnnadd:`${user.state.ad}`");
    debugPrint("useradminnnnnnnnnmail:`${user.state.mail}`");
    debugPrint("useradminnnnnnnnnaktif:`${user.state.aktif}`");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50))),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBar(
                        labelStyle: context.textTheme.bodyLarge,
                        unselectedLabelStyle: context.textTheme.bodyMedium,
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: "CariCart",
                          ),
                          Tab(
                            text: "MarsatMas",
                          ),
                          Tab(
                            text: "Pomvardimas",
                          )
                        ]))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      CariCartView(),
                      MarsatmasView(),
                      PomvardimasView()
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
