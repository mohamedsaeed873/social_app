
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/Pages/login/loginCubit/cubit.dart';
import 'package:social_app/Pages/login/loginCubit/state.dart';

import 'package:social_app/shared/componnetns/components.dart';
import 'package:social_app/shared/network/cache_helper.dart';
import '../../Cubit/SocialCubit.dart';
import '../../layout/Home/Home/home_layout.dart';
import '../../shared/componnetns/constants.dart';

import '../Register/register_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
              uId = state.uid;
              navigateAndFinish(context, const HomeLayout());
            });
          } else if (state is LoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.error,
            );
          }
        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            backgroundColor:  Colors.white,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                 // navigateTo(context, const OnBoard());
                },
                icon: Icon(
                  IconlyLight.arrowLeft2,
                  size: 30,
                  color:  Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text(
                          'Sign in Now',
                          style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      space(0, 10),
                      Text(
                        'Please enter your information',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'E-mail Address',
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFormField(
                        context: context,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your E-mail';
                          }
                          return null;
                        },
                        hint: 'E-mail',
                        prefix: Icons.email ,
                      ),
                      space(0, 20),
                      Text(
                        'Password',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      space(0, 10),
                      defaultTextFormField(
                        context: context,
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        hint: 'Password',
                        prefix: Icons.lock_outline_rounded,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixPressed: () {
                          LoginCubit.get(context).showPassword();
                        },
                      ),
                      space(0, 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                             // navigateTo(context, RestPasswordScreen());
                            },
                            child: Text(
                              'Forget Password ?',
                              style: GoogleFonts.lobster(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space(0, 30),
                      state is! LoginLoadingState
                          ? Center(
                              child: defaultMaterialButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context)
                                        .userLogin(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                text: 'Login',
                                isUpperCase: true
                              ),
                            )
                          : const Center(
                              child: LinearProgressIndicator(),
                            ),
                      space(0, 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                color:
                                     Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                               TextButton(
                                  onPressed: () {
                                    navigateTo(context, const RegisterScreen());
                                  },
                                  child: Text(
                                    'Register Now!',
                                    style: GoogleFonts.lobster(
                                      textStyle: TextStyle(
                                        color
                                            : Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
