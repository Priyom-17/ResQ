import 'package:assignment_saleheen/child/child_home_page.dart';
import 'package:assignment_saleheen/components/custom_text_field.dart';
import 'package:assignment_saleheen/components/primary_button.dart';
import 'package:assignment_saleheen/components/secondary_button.dart';
import 'package:assignment_saleheen/child/register_child.dart';
import 'package:assignment_saleheen/parent/parent_home_sceen.dart';
import 'package:assignment_saleheen/parent/parent_register_screen.dart';
import 'package:assignment_saleheen/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String,Object>();
  bool isLoading=false;
  _onSubmit()async{
    _formKey.currentState!.save();
    try {
      setState(() {
        isLoading=true;
      }); 
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email:_formData['email'].toString(),
    password: _formData['password'].toString());
    if(userCredential.user!=null){
      setState(() {
        isLoading=false;
      });
      FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get()
            .then((value) {
          if (value['type'] == 'parent') {
            print(value['type']);
            //MySharedPrefference.saveUserType('parent');
            goTo(context, ParentHomeScreen());
          } else {
            //MySharedPrefference.saveUserType('child');

            goTo(context, HomeScreen());
          }
        });
      goTo(context, HomeScreen());
    }
} on FirebaseAuthException catch (e) {
  setState(() {
    isLoading=false;
  });
  if (e.code == 'user-not-found') {
    dialogueBox(context, 'No user Found for that email');
    //print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    dialogueBox(context, 'Wrong Password');
    //print('Wrong password provided for that user.');
  }
}
    print(_formData['email']);
    print(_formData['password']);

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Stack(
              children: [
                 isLoading
                  ? progressIndicator(  context)
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    
                      Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "USER LOGIN",
                            style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          
                          ),
                          Image.asset(
                        'lib/assets/logoo.png',
                        
                        height: 190,
                        width: 200,
                        ),
                        ],
                      ),
                    ),
                         
                    Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Form(
                        key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            hintText: 'Enter email',
                            textInputAction: TextInputAction.next,
                            keyboardtype: TextInputType.emailAddress,
                            prefix: Icon(Icons.person),
                            onsave: (email){
                              _formData['email']= email?? "";
                              
                            },
                            validate: (email){
                              if(email!.isEmpty||email.length<3||email.contains("@")){
                                return 'enter correct email';
                              }
                              return null;
                      
                            },
                          
                          ),
                          CustomTextField(
                        hintText: 'Enter password',
                        isPassword: isPasswordShown,
                      
                        prefix: Icon(Icons.vpn_key_off_rounded),
                        onsave: (password){
                          _formData['password']= password??"";
                      
                        },
                         validate: (password){
                              if(password!.isEmpty||password.length<7 ){
                                return 'enter correct password';
                              }
                              return null;
                      
                            },
                        suffix:IconButton(
                           onPressed: () {
                            setState((){
                               isPasswordShown = !isPasswordShown;
                      
                            });
                           
                           } ,icon:Icon(Icons.visibility)),
                      ),
                      PrimaryButton(
                        title: 'LOGIN',
                       onPressed: () {
                        
                        if(_formKey.currentState!.validate())
                        _formKey.currentState!.save();
                        _onSubmit();
                      }),
                      ],
                      ),
                    ),
                    
                    ), 
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password!?",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                      
                          ),
                          SecondaryButton(onPressed: () {}, title: 'Click here'),
                        ],
                      ),
                    
                      
                    ),
                     SecondaryButton( title: 'REGISTER NEW USER',
                     onPressed: ()
                      {
                        goTo(context, RegisterChildScreen());
                     }),
                     SecondaryButton( title: 'REGISTER AS RESCUER',
                     onPressed: ()
                      {
                        //goTo(context, RegisterParentScreen());
                     }),
                 
                  ],
                          )
                ),
              ],
            )
        ),
      )
      ),
    );
  }
}