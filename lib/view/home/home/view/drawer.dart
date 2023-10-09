import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/view/riverpod/riverpod_genel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber[100],
      width: 250,
      child: Consumer(
        builder: (context, ref, child) => ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("BackOfise App",
                  style: context.textTheme.titleLarge
                      ?.copyWith(color: Colors.black)),
              accountEmail: Text("mesuti@gmail.com",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("asset/img/person.png"),
              ),
              /*   decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/img/person.png"),
                  fit: BoxFit.fill,
                ),
              ), */
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ExpansionTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text("Hizmet Tablosu"),
              children: [
                ListTile(
                  title: Text("CariCart"),
                  onTap: () {
                    ref.read(showHello.notifier).change(value: 0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Marsatmas"),
                  onTap: () {
                    ref.read(showHello.notifier).change(value: 1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Pomvardimas"),
                  onTap: () {
                    ref.read(showHello.notifier).change(value: 2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("Hizmetler"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("İletişim"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text("Çıkış"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
