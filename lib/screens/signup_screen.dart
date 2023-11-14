import 'dart:typed_data';

import 'package:bufoninstagram_flutter/resources/auth_methods.dart';
import 'package:bufoninstagram_flutter/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer';
import 'package:bufoninstagram_flutter/utilities/utils.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String assetName = 'assets/instagram_logo.svg';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  Uint8List? image;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void selectImage() async {
    var imageFromGallery = await imagePicker(ImageSource.gallery);
    setState(() {
      image = imageFromGallery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  assetName,
                  height: 100,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    image != null
                        ? CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.grey,
                            backgroundImage: MemoryImage(image!),
                          )
                        : const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/R.db0469234d3b806eda66a151ac198647?rik=oHqNIwcE8ji32Q&pid=ImgRaw&r=0"),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () {
                            selectImage();
                          },
                          icon: const Icon(Icons.add_a_photo),
                        )),
                  ],
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //userName input
                TextFieldInput(
                    textEditingController: userNameController,
                    hintText: 'Enter User Name',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                //email input
                TextFieldInput(
                    textEditingController: emailController,
                    hintText: 'Enter Email',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5)),
                    Text(
                      'Bio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                //bio input
                TextFieldInput(
                    textEditingController: bioController,
                    hintText: 'Enter Your Bio',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                TextFieldInput(
                    textEditingController: passwordController,
                    hintText: 'Enter Your Password',
                    isPass: true,
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () async {
                    String response = await AuthMethods().signUpUser(
                        email: emailController.text,
                        password: passwordController.text,
                        userName: userNameController.text,
                        bio: bioController.text,
                        profileImage: image!);
                    log(response);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    minimumSize: const Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        log('Sign Up');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
