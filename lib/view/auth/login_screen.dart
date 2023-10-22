import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medical_app/view/auth/forget_password_screen.dart';
import 'package:medical_app/view/auth/signup_screen.dart';
import '../../app_consts/app_color.dart';
import '../../app_consts/auth_validator.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/google_button.dart';
import '../../widgets/guest_button.dart';
import '../../widgets/subtitle_widget.dart';
import '../../widgets/title_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login-screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailNode;
  late final FocusNode passwordNode;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _isLoading = false;
  var obscureText = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  Future<void> loginFun() async {
    final _isValid = _fromKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
            const AuthHeader(
                title: 'Welcome Back 😀',
                subText: 'Let\'s get you logged in '),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                focusNode: emailNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Your e-mail',
                  prefixIcon: Icon(
                    IconlyLight.message,
                    color: AppColors.lightPrimary,
                  ),
                ),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
                validator: (value) {
                  return AuthValidator.emailValidator(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: obscureText,
                controller: passwordController,
                focusNode: passwordNode,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                decoration:   InputDecoration(
                  hintText: '*******',
                  prefixIcon: const Icon(IconlyLight.lock,color: AppColors.lightPrimary,),
                  suffixIcon:IconButton(onPressed: (){
                    setState(() {
                      obscureText =! obscureText;
                    });
                  },
                      icon:  Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            :Icons.visibility_outlined,
                        color: AppColors.lightPrimary,
                      ),)
                ),
                onFieldSubmitted: (value) async {
                  await loginFun();
                },
                validator: (value) {
                  return AuthValidator.passWordValidator(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        // Navigator.pushNamed(context, ForgetPassWordScreen.id);
                      },
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, ForgetPassWordScreen.id);
                        },
                        child: const SubtitleTextWidget(
                          subTitle: 'Forget Password ?',
                          textDecoration: TextDecoration.underline,
                          color: AppColors.lightPrimary,
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: AppColors.lightPrimary),
                        onPressed: ()async {
                          await loginFun();
                        },
                        child: const TitleTextWidget(
                          title: 'Sign in',
                          fontSize: 24,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SubtitleTextWidget(
                    subTitle: '-OR-',
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GoogleButton(),
                      GuestButton(onPressed: (){})
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SubtitleTextWidget(subTitle: 'Don\'t have an account? '),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: const TitleTextWidget(title: 'Sign up 👍🏼',fontSize: 22,color: AppColors.lightPrimary,))
                  ],
                )
          ]),
        ),
      ),
    );
  }
}
