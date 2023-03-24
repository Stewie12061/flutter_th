import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/homepage/components/fragment/account_detail.dart';
import 'package:thflutter/homepage/components/fragment/favorite_fragment.dart';
import 'package:thflutter/homepage/components/fragment/home_fragment.dart';
import 'package:thflutter/homepage/components/homeheader.dart';
import 'package:thflutter/homepage/components/fragment/notification_fragment.dart';
import 'package:thflutter/model/utilities.dart';
import 'menuheader.dart';

class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>{
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
      FavoriteDetail(Utilities().data),
      NotificationDetail(),
      AccountDetail()
    ];

    return
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: flag ? HomeHeader() : MenuHeader(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
              if (selectIndex != 3) {
                flag = true;
              } else {
                flag = flag;
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account'
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              screen[selectIndex]
            ],
          ),
        ),
      );
  }
}