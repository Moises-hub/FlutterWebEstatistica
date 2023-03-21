import 'dart:convert';

import 'package:coliseuestatistica/controller/menucontroller.dart';
import 'package:coliseuestatistica/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String user;
  final String foto;

   Header(this.user, this.foto);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        if(!Responsive.isDesktop(context))
         IconButton(onPressed:

             context.read<MenuController>().controlMenu,
             icon: const Icon(Icons.menu)),

        const SizedBox(
          width: 25,
        ),
        Image.asset('assets/icones/Graph-PNG-HD.png',width: 30,color: CupertinoColors.secondaryLabel,),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "DashBoard",
          style: TextStyle(color: Colors.white54),
        ),
        const Spacer(),
        ProfileCard(user,foto),
      ],
    );
  }
}


class ProfileCard extends StatelessWidget {
  final String user;
  final String foto;

  ProfileCard(this.user, this.foto);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: CupertinoColors.darkBackgroundGray,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: CupertinoColors.black,

      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundImage: MemoryImage(base64Decode(foto)),
            backgroundColor: Colors.white,

          ),

          const SizedBox(
            width: 10,
          ),

          Text(
            user,
            style: TextStyle(fontSize: 10),
          ),

        ],
      ),
    );
  }
}

