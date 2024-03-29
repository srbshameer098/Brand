
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../UI/Bottomnav.dart';
import '../UI/Home.dart';
import '../Widgets/RoundButton.dart';
import '../utiles/Utils.dart';
import 'Phone.dart';
import 'Signup.dart';

GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https;//www.googleapis.com/auth/contacts.readonly'
]);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  bool loading1 = false;
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool value = false;
  bool isVisible = true;

  void login() {
    setState(() {
      loading = true;
    });
    auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
    });
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  //
  // void signinwithGoogle() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //   try{
  //
  //
  //     final  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //
  //     if(googleSignInAccount != null) {
  //       final GoogleSignInAuthentication? googleAuth = await
  //       googleSignInAccount?.authentication;
  //
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth?.accessToken,
  //           idToken: googleAuth?.idToken
  //       );
  //
  //       await firebaseAuth.(credential);
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_screen())
  //     }
  //   }catch(e){
  //
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 55.h, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h,),
              Center(
                child: SizedBox(height: 150.h,width: 150.w,
                  child: Image.asset("assets/Brand.png",
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  Text('Welcome!', style: TextStyle(color: Colors.black,fontSize: 28.sp,fontWeight: FontWeight.w700),)
              ),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  Text('please login or sign up to continue our app', style: TextStyle(color: Colors.black,fontSize: 16.sp),textAlign: TextAlign.center,)
              ),
              SizedBox(height: 50.h,),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                             // hintText: ' example@gmail.com',
                            label: Text('Email',style:TextStyle(color: Colors.black,fontSize: 23.sp,fontWeight: FontWeight.w400) ,),
                            // helperText: 'enter email e.g: example@gmail.com',
                            // prefixIcon: Icon(
                            //   Icons.alternate_email_rounded,
                            //   color: Colors.black,
                            // )
                           ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                         obscureText: isVisible,
                        decoration: InputDecoration(
                           label:Text('Password',style:TextStyle(color: Colors.black,fontSize: 23.sp,fontWeight: FontWeight.w400) ,) ,
                            // helperText: 'enter password e.g: ********',
                            // prefixIcon: Icon(
                            //   Icons.lock_outline_rounded,
                            //   color: Colors.black,
                            // ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {

                                  isVisible = !isVisible;
                                });
                              },
                              child: isVisible == false
                                  ? const FaIcon(
                                Icons.remove_red_eye_outlined,

                                      size: 24,
                                      color: Colors.grey,
                                    )
                                  : FaIcon(
                                FontAwesomeIcons.eyeSlash,

                                      size: 18.sp,
                                      color: Colors.grey,
                                    ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 50.h),
              TubeButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    RoundButton(
                        Icons: FontAwesomeIcons.google,
                        title: 'Google',
                        onTap: () {
                          signInWithGoogle().then((value) {
                            Utils().toastMessage(value.user!.email.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNav()));
                            setState(() {
                              loading = false;
                            });
                          }).onError((error, stackTrace) {
                            debugPrint(error.toString());
                            Utils().toastMessage(error.toString());
                          });
                        }),
                    SizedBox(
                      width: 20.w,
                    ),
                    RoundButton(
                        Icons: FontAwesomeIcons.phone,
                        title: 'Phone',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInWithPhoneNumber()));
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don`t have an account ?  ',
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        'Sign up ',
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
