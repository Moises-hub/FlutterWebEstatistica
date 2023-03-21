import 'package:coliseuestatistica/controller/menucontroller.dart';
import 'package:coliseuestatistica/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../responsive.dart';


class MainScreen extends StatelessWidget {
  final PageController pageController;
  final String user;
  final String foto;
 MainScreen(this.pageController, this.user, this.foto);

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          drawer: SideMenu(pageController),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: SideMenu(pageController),
                  ),
                Expanded(
                  flex: 5,
                  child: DashboardScreen(user,foto),
                ),

                //
              ],
            ),
          ),

    );
  }
}

class SideMenu extends StatelessWidget {
  final PageController pageController;


 SideMenu(this.pageController);

  @override
  Widget build(BuildContext context) {


    return Drawer(
      backgroundColor: CupertinoColors.black,
      child:


      SingleChildScrollView(

        child:

        Column(

          children: [

          DrawerHeader(
            child: Image.asset('assets/images/Imagem1.png'),
          ),

              DrawerListTile(
              title: "DashBoard",
              icone: CupertinoIcons.gauge,
              controller: pageController,
              page: 0,
            ),

              DrawerListTile(
              title: "Movimentação Clientes",
              icone: Icons.height,
              controller: pageController,
              page: 1,
            ),
            DrawerListTile(
              title: "Clientes",
              icone: Icons.people,
              controller: pageController,
              page: 3,
            )
          ],
        ),
      ),


    );
  }
}

class DrawerListTile extends StatelessWidget {
  final PageController controller;
  final int page;

  const DrawerListTile(
      {Key? key,
      required this.title,
      required this.icone,
      required this.controller,
      required this.page
   })
      : super(key: key);

  final String title;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: ListTile(


      onTap: () {
        if(!Responsive.isDesktop(context)) {
          Navigator.of(context).pop();
        }
        controller.jumpToPage(page);
      },
      horizontalTitleGap: 0.0,
      leading:
      Icon(icone, color: Colors.white54, size: 30),


      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white54, fontSize: 15, fontWeight: FontWeight.normal),
      ),
    ));
  }
}
