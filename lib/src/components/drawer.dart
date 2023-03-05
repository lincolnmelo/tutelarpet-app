import 'dart:io';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  var imageAvatar = const AssetImage("lib/assets/images/avatar.png");
  var title = const Text("Tutor");
  var user = const Text("Anderson Duarte");

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          infoPerson(),
          divider(8, 0, Theme.of(context).dividerColor),
          listView(),
          infoBottom()
        ],
      ),
    ));
  }

  Widget infoPerson() {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        otherAccountsPictures: [
          IconButton(
              icon: const Icon(Icons.chevron_left),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        currentAccountPicture: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: BoxFit.fill, image: imageAvatar))),
        accountName: title,
        accountEmail: user);
  }

  Widget infoBottom() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text(
                                    "Tutor",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20),
                                  ),
                                  content: const Text("Deseja sair do App?"),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text(
                                          "Não",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    TextButton(
                                        child: Text(
                                          "Sim",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          exit(0);
                                        })
                                  ]);
                            },
                          );
                        },
                        splashColor: Colors.white,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              Text('Sair',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget listView() {
    var color = Theme.of(context).dividerColor;
    var colorIcon = Theme.of(context).secondaryHeaderColor;
    return Column(
      children: [
        listTile(Icon(Icons.monitor_heart, color: colorIcon),
            const Text("Status Pets"), '/home'),
        divider(0.8, 70, color),
        listTile(Icon(Icons.pets, color: colorIcon), const Text("Meus Pets"),
            '/home'),
        divider(0.8, 70, color),
        listTile(Icon(Icons.account_circle, color: colorIcon),
            const Text("Minha conta"), '/home'),
        divider(0.8, 70, color)
      ],
    );
  }

  Widget divider(double pThickness, double pEndIndent, Color pColor) {
    return Divider(
      color: pColor,
      height: 0,
      thickness: pThickness,
      indent: 0,
      endIndent: pEndIndent,
    );
  }

  Widget listTile(Icon incon, Text text, String route) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
      splashColor: Theme.of(context).dividerColor,
      child: ListTile(
        leading: incon,
        title: text,
      ),
    );
  }
}
