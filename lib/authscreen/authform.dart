import 'package:flutter/material.dart';
import 'package:todolistapp/authscreen/authscreen.dart';

class Authform extends StatefulWidget {
  const Authform({super.key});
  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<Authform> {
  final _formkey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoginPage = false;

  authenticate() {
    final validity = _formkey.currentState!.validate();
    print(userNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  if (!isLoginPage)
                    TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'username is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter UserName"),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    key: const ValueKey('email'),
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Enter valid email address";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Email Address"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    key: const ValueKey('password'),
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Enter valid Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        authenticate();
                      },
                      child: isLoginPage ? Text('Login') : Text('Signup'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                    },
                    // is loginpage changes the state
                    child: isLoginPage
                        ? Text('Not a member')
                        : Text('Already a member?'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
