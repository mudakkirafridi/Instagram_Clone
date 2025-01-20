import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //svg image
            SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 64,),
            const SizedBox(height: 64,),
            //textfield for email
            TextFieldInput(textEditingController: _emailController, isPass: false, hintText: "Enter Your Email", textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            // textfield for password
            TextFieldInput(textEditingController: _passwordController, isPass: true, hintText: "Enter Your Password", textInputType: TextInputType.text),
            //button login
            const SizedBox(height: 24,),
            InkWell(
              onTap: (){
            
              },
              child: Container(
                
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration:const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  color: blueColor
                ),
                child: const Text('LogIn'),
              ),
            ),
            const SizedBox(height: 12,),
            Flexible(flex: 2,child: Container(),),
            //transitioning to signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text("Don't Have An Account? "),
              ),
              InkWell(
                onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignupScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              )
              ],
            )
          ],
        ),
      )
      ),
    );
  }
}