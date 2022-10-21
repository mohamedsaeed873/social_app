import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/Cubit/SocialCubit.dart';
import 'package:social_app/Pages/Register/registerCubit/cubit.dart';
import 'package:social_app/Pages/Register/registerCubit/state.dart';
import 'package:social_app/Pages/login/login_screen.dart';
import 'package:social_app/shared/componnetns/components.dart';
import '../../layout/Home/Home/home_layout.dart';
import '../../shared/componnetns/constants.dart';
import '../../shared/network/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is UserCreateSuccessState) {
            CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
              uId = state.uid;
              navigateTo(context, const HomeLayout());
            });
          }

        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  pop(context);
                },
                icon: Icon(
                  IconlyLight.arrowLeft2,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text(
                          'Sign up Now',
                          style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                              color: Colors.black,
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
                      space(0, 20),
                      Text(
                        'Full Name',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      space(0, 5),
                      defaultTextFormField(
                        context: context,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                        hint: 'Name',
                        prefix: Icons.person_outline_rounded,
                      ),
                      space(0, 10),
                      Text(
                        'Phone',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      space(0, 5),
                      defaultTextFormField(
                        context: context,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                        hint: 'Phone',
                        prefix: Icons.phone,
                      ),
                      space(0, 10),
                      Text(
                        'E-mail Address',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      space(0, 5),
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
                        prefix: Icons.email,
                      ),
                      space(0, 10),
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
                      space(0, 5),
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
                        suffix: RegisterCubit.get(context).suffix,
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePassword();
                        },
                      ),
                      space(0, 20),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultMaterialButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passController.text,
                                  phone: phoneController.text,
                                  name: nameController.text,
                                );
                              }
                            },
                            text: 'Register',

                          ),
                          fallback: (BuildContext context) =>
                              const Center(child: LinearProgressIndicator()),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, const LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.lobster(
                                textStyle: const TextStyle(
                                  color: Colors.blue,
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
