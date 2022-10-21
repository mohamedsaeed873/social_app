import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/SocialCubit.dart';
import 'package:social_app/Cubit/SocialState.dart';
import 'package:social_app/layout/Home/Home/home_layout.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/componnetns/constants.dart';
import 'package:social_app/shared/network/cache_helper.dart';
import 'package:social_app/shared/styles/themes.dart';

import 'Pages/login/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
        () {},
    blocObserver: MyBlocObserver(),
  );

  await CacheHelper.init();
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget =  const HomeLayout();
  } else {
    widget = const LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}


class MyApp extends StatelessWidget {
  final  Widget startWidget;
  const MyApp({super.key, required this.startWidget, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SocialCubit()
              ..getUserData()
              ..getPosts()
              ..getAllUsers()
              ..getStories()
        ),
      ],
      child: BlocConsumer<SocialCubit , SocialStates>(
        listener: (context,state){},
        builder: (context ,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:ThemeMode.dark,
            title: 'SocialApp',
            home:  startWidget,
          );
        },
      ),
    );
  }
}