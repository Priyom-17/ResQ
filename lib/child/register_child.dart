import 'package:assignment_saleheen/components/custom_text_field.dart';
import 'package:assignment_saleheen/components/primary_button.dart';
import 'package:assignment_saleheen/components/secondary_button.dart';
import 'package:assignment_saleheen/child/child_login_screen.dart';
import 'package:assignment_saleheen/model/user_model.dart';
import 'package:assignment_saleheen/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterChildScreen extends StatefulWidget {
  @override
  State<RegisterChildScreen> createState() => _RegisterChildScreenState();
}
class _RegisterChildScreenState extends State<RegisterChildScreen> {
  bool isPasswordShown = false;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String,Object>();

  _onSubmit(){
    _formKey.currentState!.save();
    if (_formData['password'] != _formData['rpassword']) {
      dialogueBox(context, 'passwords does not match');

    } else {
      progressIndicator(context);
      try{
        FirebaseAuth auth=FirebaseAuth.instance;
        auth.createUserWithEmailAndPassword(email: _formData['email'].toString(), password: _formData['password'].toString()).then((v) async {
          DocumentReference<Map<String, dynamic>> db=FirebaseFirestore.instance.collection('users').doc(v.user!.uid);
          
          final user=UserModel(
            name:_formData['name'].toString(),
            phone:_formData['phone'].toString(),
            childEmail:_formData['email'].toString(),
            parentEmail:_formData['gemail'].toString(),
            id:v.user!.uid,

          );
          final jsonData=user.toJson();
          await db.set(jsonData).whenComplete(() {
            goTo(context,LoginScreen());

          });
          
          

        });
      } on FirebaseAuthException catch(e){
        dialogueBox(context,e.toString());
      }

      catch(e){
        dialogueBox(context,e.toString());
      }

    }
    print(_formData['email']);
    print(_formData['password']);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                            Container(
                      height: MediaQuery.of(context).size.height*0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "       Register as User        ",
                            style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          
                          ),
                          Image.asset(
                        'lib/assets/logoo.png',
                        
                        height: 100,
                        width: 100,
                        ),
                        ],
                      ),
                    ),
                    Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  child: Form(
                    key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        hintText: 'Enter Name',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.name,
                        prefix: Icon(Icons.person),
                        onsave: (name){
                          _formData['name']= name ?? "";
                          
                        },
                        validate: (email){
                          if(email!.isEmpty||email.length<3){
                            return 'enter correct name';
                          }
                          return null;
            
                        }, 
                    
                      
                      ),
                      CustomTextField(
                        hintText: 'Enter Phone',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.phone,
                        prefix: Icon(Icons.phone),
                        onsave: (phone){
                          _formData['phone']=phone ?? "";
                          
                        },
                        validate: (email){
                          if(email!.isEmpty||email.length<10){
                            return 'enter correct phone';
                          }
                          return null;
            
                        }, 
                      
                      ),
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
                          if(email!.isEmpty||email.length<3){
                            return 'enter correct email';
                          }
                          return null;
            
                        }
                        }
                      
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
                   CustomTextField(
                    hintText: 'retype password',
                    isPassword: isPasswordShown,

                    prefix: Icon(Icons.vpn_key_off_rounded),
                    onsave: (password){
                      _formData['password']= password??"";
                      _formData['rpassword']= password??"";

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
                    title: 'REGISTER',
                   onPressed: () {
                    if(_formKey.currentState!.validate())
                    _onSubmit();
                  }),
                  ],
                  ),
                ),
                
                ), 
                
                 SecondaryButton( title: 'LOG IN WITH YOUR ACCOUNT',
                 onPressed: ()
                  {
                    goTo(context, LoginScreen());
                 }),
             
                    
              ]),
          ),
        ),
      ),
    );
  }
}