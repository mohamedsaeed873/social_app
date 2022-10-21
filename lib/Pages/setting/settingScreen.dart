
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:social_app/Cubit/SocialState.dart';
import 'package:social_app/Pages/profile/Edit_profile_screen.dart';
import 'package:social_app/Pages/profile/My_profile_screen.dart';
import 'package:social_app/shared/componnetns/components.dart';
import 'package:social_app/shared/componnetns/constants.dart';

import '../../Cubit/SocialCubit.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel!;
        var cubit = SocialCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 2.0,
                  color: Colors.grey.shade200,
                ),
                Card(
                  elevation: 10,
                  color:
                      cubit.isLight ? Colors.white : const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const MyProfileScreen());
                      },
                      child: Row(
                        children: [
                           CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              userModel.image!,
                            ),
                          ),
                          space(10, 0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userModel.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.alegreyaSansSc(
                                    color: cubit.isLight
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'see your profile',
                                  style: GoogleFonts.alata(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: cubit.isLight
                                              ? Colors.black54
                                              : Colors.white,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                space(0, 10),
                Text(
                  'Account',
                  style: GoogleFonts.alegreyaSansSc(
                    color: cubit.isLight ? Colors.white : Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 2.0,
                  color: Colors.grey.shade200,
                ),
                Card(
                  color:
                      cubit.isLight ? Colors.white : const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                            navigateTo(context,  EditProfileScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyBroken.profile,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'Your Personal info',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  color:
                      cubit.isLight ? Colors.white : const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                       // navigateTo(context, RestPasswordScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyBroken.lock,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'Rest Password',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  color:
                      cubit.isLight ? Colors.white: const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        //navigateTo(context, const EditPasswordScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyBroken.unlock,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'Change Password',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  color:
                      cubit.isLight ? Colors.white : const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Alert(
                          style: AlertStyle(
                            animationType: AnimationType.shrink,
                            animationDuration:
                                const Duration(milliseconds: 2000),
                            backgroundColor: cubit.isLight
                                ? const Color(0xff063750)
                                : Colors.white,
                            isCloseButton: false,
                            titleStyle: GoogleFonts.lobster(
                              color: cubit.isLight ? Colors.white : Colors.black,
                            ),
                            descStyle: GoogleFonts.lobster(
                              color: cubit.isLight ? Colors.white : Colors.black,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          image: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Image(
                                height: 200,
                                width: 500,
                                fit: BoxFit.cover,
                                image: cubit.isLight
                                    ? const NetworkImage(
                                        'https://img.freepik.com/free-photo/sunset-sea-with-boat_1048-4663.jpg?w=1380&t=st=1659993560~exp=1659994160~hmac=d0f989119865cff1b42bd569abad29f8bf6c4fb8e96d39bad12c7e0395e956de')
                                    : const NetworkImage(
                                        'https://img.freepik.com/free-photo/beautiful-landscape-sea-ocean-leisure-travel-vacation_74190-8013.jpg?w=996&t=st=1659993461~exp=1659994061~hmac=60ab6a480487329ba91625137fdf6705f5e34600a7cd3af37d866326bec91290'),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  IconlyBold.closeSquare,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          context: context,
                          title: "Theme Mode",
                          desc: "Do you want change mode.",
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              color: Colors.red,
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DialogButton(
                              onPressed: () {
                                cubit.changeMode();
                                Navigator.pop(context);
                              },
                              color: Colors.blue,
                              child: Text(
                                "Done",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ).show();
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              cubit.isLight
                                  ? Icons.nightlight_outlined
                                  : Icons.wb_sunny,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'Theme Mode',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Card(
                  color:
                      cubit.isLight ? Colors.white: const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()
                      {
                        Alert(
                          style: AlertStyle(
                            animationType: AnimationType.shrink,
                            animationDuration:
                            const Duration(milliseconds: 2000),
                            backgroundColor: cubit.isLight
                                ? const Color(0xff063750)
                                : Colors.white,
                            isCloseButton: false,
                            titleStyle: GoogleFonts.lobster(
                              color: cubit.isLight ? Colors.white : Colors.black,
                            ),
                            descStyle: GoogleFonts.lobster(
                              color: cubit.isLight ? Colors.white : Colors.black,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          image: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Image(
                                height: 200,
                                width: 500,
                                fit: BoxFit.cover,
                                image: cubit.isLight
                                    ? const NetworkImage(
                                    'https://img.freepik.com/premium-vector/blocked-account-conceptual-design-premium-vector_199064-108.jpg?w=740')
                                    : const NetworkImage(
                                    'https://img.freepik.com/premium-vector/blocked-account-conceptual-design-premium-vector_199064-109.jpg?w=740'),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  IconlyBold.closeSquare,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          context: context,
                          desc: "Do you want Delete Account.",
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              color: Colors.red,
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            DialogButton(
                              onPressed: () {
                                cubit.deleteAccount(context);
                                Navigator.pop(context);
                              },
                              color: Colors.blue,
                              child: Text(
                                "Done",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ).show();

                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyBroken.delete,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'Delete your Account',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color:
                      cubit.isLight ? Colors.white : const Color(0xff063750),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        logOut(context);
                        FirebaseAuth.instance.signOut();
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.power_settings_new_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          space(10, 0),
                          Text(
                            'LogOut',
                            style: GoogleFonts.alegreyaSansSc(
                              color: cubit.isLight ? Colors.black : Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            IconlyLight.arrowRight2,
                            color: cubit.isLight ? Colors.black : Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
