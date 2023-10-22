import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/app_consts/app_dialog.dart';
import 'package:medical_app/app_consts/loading_manager.dart';
import 'package:medical_app/widgets/auth_header.dart';
import 'package:medical_app/widgets/pick_image_widget.dart';
import '../../app_consts/auth_validator.dart';
import '../../widgets/title_text_widget.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
static String id = 'signup-screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController fullName;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController repeatPasswordController;
  late final FocusNode name;
  late final FocusNode emailNode;
  late final FocusNode passwordNode;
  late final FocusNode repeatPasswordNode;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _isLoading =false;
  var obscureText = true;
  XFile? pickedImage;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    fullName = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    name = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    repeatPasswordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    fullName.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    name.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    repeatPasswordNode.dispose();
    super.dispose();
  }
  Future<void> submitOnRegister() async {
    final _isValid = _fromKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(pickedImage == null){
      AppDialog.errorDialog(context: context, text: 'Please select an image');
      return;
    }
    if(_isValid){
      try{
        setState(() {
          _isLoading= true;
        });
        await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        Fluttertoast.showToast(
            msg: 'Successfully registered',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }on FirebaseException catch(e){
        AppDialog.errorDialog(
          context: context,
          text: e.message.toString(),
        );
      }catch(e){
        AppDialog.warningDialog(
            context: context,
            text: e.toString(),
            fun: (){});
      }finally{
        setState(() {
          _isLoading= false;
        });
      }
    }
  }

  Future<void>localImagePicker()async{
    final ImagePicker picker = ImagePicker();
    await AppDialog.imagePickerDialog(
      context: context,
      cameraFct: ()async{
        pickedImage =await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFct: ()async{
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFct: (){
        setState(() {
          pickedImage = null;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoadingManager(
        isLoading: _isLoading,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
            children: [
              const AuthHeader(
                  title: 'Sign up 😉',
                  subText: 'Let\'s create an account'),
              const SizedBox(
                height: 20,
              ),
            //  TODO: add image picker
              Center(
                child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  child: PickImageWidget(fun: ()async{
                    await localImagePicker();
                  },
                  pickImage:pickedImage ,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   TextFormField(
                     controller: fullName,
                     focusNode: name,
                     textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                       hintText: 'Name',
                       prefixIcon: Icon(IconlyLight.user2,color: AppColors.lightPrimary,),
                     ),
                     validator: (value) {
                       return AuthValidator.displayNameValidator(value);
                     },
                     onFieldSubmitted: (value) {
                       FocusScope.of(context).requestFocus(emailNode);
                     },
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   TextFormField(
                     controller: emailController,
                     focusNode: emailNode,
                     textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                       hintText: 'Your e-mail',
                       prefixIcon: Icon(IconlyLight.message,color: AppColors.lightPrimary,),
                     ),
                     validator: (value) {
                       return AuthValidator.emailValidator(value);
                     },
                     onEditingComplete: () =>
                         FocusScope.of(context).requestFocus(passwordNode),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   TextFormField(
                     controller: passwordController,
                     obscureText: obscureText,
                     focusNode: passwordNode,
                     textInputAction: TextInputAction.next,
                     keyboardType: TextInputType.multiline,
                     decoration: InputDecoration(
                       hintText: '*******',
                       prefixIcon: const Icon(IconlyLight.lock,color: AppColors.lightPrimary,),
                       suffixIcon: IconButton(
                         onPressed: () {
                           setState(() {
                             obscureText = !obscureText;
                           });
                         },
                         icon: Icon(obscureText
                             ? Icons.visibility_off_outlined
                             : Icons.visibility_outlined),
                       ),
                     ),
                     validator: (value) {
                       return AuthValidator.passWordValidator(value);
                     },
                     onEditingComplete: () =>
                         FocusScope.of(context).requestFocus(repeatPasswordNode),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   TextFormField(
                     obscureText: obscureText,
                     controller: repeatPasswordController,
                     focusNode: repeatPasswordNode,
                     textInputAction: TextInputAction.done,
                     keyboardType: TextInputType.multiline,
                     decoration: InputDecoration(
                       hintText: '*******',
                       prefixIcon: const Icon(IconlyLight.lock,color: AppColors.lightPrimary,),
                       suffixIcon: IconButton(
                         onPressed: () {
                           setState(() {
                             obscureText = !obscureText;
                           });
                         },
                         icon: Icon(obscureText
                             ? Icons.visibility_off_outlined
                             : Icons.visibility_outlined),
                       ),
                     ),
                     onFieldSubmitted: (value) {
                       submitOnRegister();
                     },
                     validator: (value) {
                       return AuthValidator.repeatPassWordValidator(
                           value, passwordController.text);
                     },
                   ),
                 ],
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
                      onPressed: () async {
                        await submitOnRegister();
                      },
                      child: const TitleTextWidget(
                        title: 'Sign up',
                        fontSize: 24,
                      )),
                ),
              ),
            ],
        ),
          ),),
      ),
    );
  }
}
