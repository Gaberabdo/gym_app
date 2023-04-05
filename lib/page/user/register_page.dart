import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/logic/helper.dart';
import 'package:gym_app/page/user/login_page.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var emailController = TextEditingController();
        var passwordController = TextEditingController();
        var phoneController = TextEditingController();
        var nameController = TextEditingController();
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(0, 169, 191, 1).withOpacity(.7),
                  Colors.greenAccent,
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: GoogleFonts.eduNswActFoundation(fontSize: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.7),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      height: 550,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(IconlyBold.profile),
                                  label: const Text('User Name'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(IconlyBold.message),
                                  label: const Text('User Email'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(IconlyBold.call),
                                  label: const Text('User Phone'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            SizedBox(
                              height: 45,
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: HomeCubit.get(context).isPassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(IconlyBold.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    icon: Icon(HomeCubit.get(context).suffix),
                                  ),
                                  label: const Text('Password'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromRGBO(0, 169, 191, 1)
                                          .withOpacity(.4),
                                      Colors.greenAccent,
                                    ],
                                  )),
                              child: MaterialButton(
                                minWidth: 0,
                                onPressed: () {
                                  HomeCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.eduNswActFoundation(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 100,
                                  height: 1,
                                  color: Colors.black,
                                ),
                                const Text('OR'),
                                Container(
                                  width: 100,
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image(
                                        image: NetworkImage(
                                            'https://th.bing.com/th/id/R.6d01562e3024d0942d6b865ac81051c0?rik=5W2z4V6l3L2Tsw&pid=ImgRaw&r=0'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image(
                                        image: NetworkImage(
                                            'https://th.bing.com/th/id/R.564aa065c4673fed19150fba25f2f7c1?rik=mEBHJRfcRXrZww&pid=ImgRaw&r=0'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image(
                                        image: NetworkImage(
                                            'https://th.bing.com/th/id/OIP.PSj_SQum7CH01WhmY2kFcAHaHx?w=185&h=195&c=7&r=0&o=5&pid=1.7'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                child: TextButton(
                                    onPressed: () {
                                      navigatorTo(context, LoginScreen());
                                    },
                                    child: Text(
                                      'have an account?  ' + '  Login',
                                      style: GoogleFonts.eduNswActFoundation(
                                          fontSize: 22, color: Colors.black),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
