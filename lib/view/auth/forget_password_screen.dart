import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medical_app/app_consts/app_color.dart';
import '../../app_consts/assets_manager.dart';
import '../../app_consts/auth_validator.dart';
import '../../widgets/subtitle_widget.dart';
import '../../widgets/title_text_widget.dart';

class ForgetPassWordScreen extends StatefulWidget {
  const ForgetPassWordScreen({super.key});
  static String id = 'forget-pass-word';
  @override
  State<ForgetPassWordScreen> createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      emailController.dispose();
    }
    super.dispose();
  }

  Future<void>forgetPassFct()async{
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid){}
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightPrimary,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AssetsManager.forgetPasswordPath,
                      fit: BoxFit.cover,
                      height: size.height * 0.4,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitleTextWidget(
                    title: 'Forget Password',
                    fontSize: 26,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SubtitleTextWidget(
                    subTitle: 'Please enter your e-mail address',
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: 'e-mail@example.com',
                        prefixIcon: Icon(
                          IconlyLight.message,
                          color: AppColors.lightPrimary,
                        )),
                    validator: (value) {
                      return AuthValidator.emailValidator(value);
                    },
                    onFieldSubmitted: (_) {
                      forgetPassFct();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      ),
                      onPressed: () async {
                        await forgetPassFct();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(IconlyBold.send),
                          TitleTextWidget(
                            title: 'Request link',
                            fontSize: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
