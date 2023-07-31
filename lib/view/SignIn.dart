import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool isPassword=true;
  Future<bool>signUp()
  async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if(credential.user!=null)
      {
       return true;
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                const Center(
                  child: Image(
                    height: 250,
                    width: 250,
                    image: AssetImage("assets/kfc.png"),
                  ),
                ),
                const SizedBox(height: 50,),
                TextFormField(
                  controller:emailController,
                  validator: (value)
                  {
                    if(value!.isEmpty| !value.contains("@"))
                    {
                      return 'Enter valid Email';
                    }
                    else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration
                    (
                      suffixIcon: Icon(Icons.email,color: Colors.red,),
                      labelText: "Email or Phone number",
                      labelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20,


                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  obscureText:isPassword,
                  validator: (value)
                  {
                    if(value!.isEmpty||value.length<8)
                    {
                      return("Invalid password");
                    }
                    else {return null;}
                  },
                  decoration:  InputDecoration
                    (
                      suffixIcon: IconButton(onPressed: (){setState(() {
                        isPassword=!isPassword;
                      });}, icon: isPassword?const Icon(CupertinoIcons.eye,color: Colors.red,):const Icon(CupertinoIcons.eye_slash,color: Colors.red,)),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,

                      )
                  ),
                ),
                const SizedBox(height: 30,),
                loginButton(
                    background: Colors.red,
                    label: 'SignUp',
                    onclick:() async
                    {

                      if (_formKey.currentState!.validate()) {

                        if(await signUp())
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('login succsess')));
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('login fail')));
                        }

                      }
                    },
                    radius: 14
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
