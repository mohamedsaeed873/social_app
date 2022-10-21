

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/SocialCubit.dart';
import 'package:social_app/Cubit/SocialState.dart';
import 'package:social_app/shared/componnetns/components.dart';

import '../../../Pages/notifications/notifications_screen.dart';
import '../../../Pages/search/search_screen.dart';
import '../../../shared/styles/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(

      listener: (context,state){},
      builder: (context ,state){
        var cubit=SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex] , style: TextStyle(color: Colors.black),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, const NotificationScreen());
              }, icon:Icon(IconBroken.Notification , color: Colors.black87,)),
              IconButton(onPressed: (){ navigateTo(context, const SearchScreen());}, icon:Icon(IconBroken.Search , color: Colors.black87,)),
            ],
            backgroundColor: Colors.white,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index){
              cubit.changeNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Message),
                  label: "Chate"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.User),
                  label: "Users"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Image_2),
                  label: "Story"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: "Settings"
              ),
            ],
          ),
        );
      },

    );
  }
}
