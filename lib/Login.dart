
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Hellouser.dart';
import 'package:untitled/Shared%20Comp.dart';
import 'package:untitled/comp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool isPassword=true;
  //IconData?suffix=IconButton(onPressed: onPressed, icon: icon);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    label: 'login',
                    onclick:()
                    {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    radius: 14
                ),

                const SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                      ),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Click here",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 45,),
                Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: MaterialButton(

                    onPressed: (){},
                    child: const Text(

                      'No ACCOUNT ?Sign Up',
                      style: TextStyle(color: CupertinoColors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
