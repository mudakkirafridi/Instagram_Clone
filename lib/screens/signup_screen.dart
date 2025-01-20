import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
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
            // cicular widget for accept and show file or images
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo , color: Colors.white,)))
              ],
            ),
            const SizedBox(height: 24,),
            // text field for username 
             TextFieldInput(textEditingController: _userNameController, isPass: false, hintText: "Enter Your UserName", textInputType: TextInputType.text),
             // some spacing 
             const SizedBox(height: 24,),
            //textfield for email
            TextFieldInput(textEditingController: _emailController, isPass: false, hintText: "Enter Your Email", textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            // textfield for password
            TextFieldInput(textEditingController: _passwordController, isPass: true, hintText: "Enter Your Password", textInputType: TextInputType.text),
            //button login
            const SizedBox(height: 24,),
             TextFieldInput(textEditingController: _bioController, isPass: false, hintText: "Enter Your Bio", textInputType: TextInputType.text),
            // for some spacing 
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
               Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("LogIn",style: TextStyle(fontWeight: FontWeight.bold),),
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