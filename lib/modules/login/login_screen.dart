import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var fromKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      type: TextInputType.visiblePassword,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'password is too short';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 defaultButton(
                     width: double.infinity,
                     background: Colors.blue,
                     function: (){
                       if(fromKey.currentState.validate()){
                         print(emailController.text);
                         print(passwordController.text);
                       }
                     },
                     radius: 5.0,
                     text: 'login'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(onPressed: (){}, child: Text(
                        'Register Now'
                      ),
                      ),
                    ],
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
