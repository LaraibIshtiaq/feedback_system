import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../shared/routes/route.gr.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Login User"),
                TextField(
                  decoration: InputDecoration(hintText: "Enter User Name"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Password"),
                  obscureText: true,
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.pushRoute(ForgetPasswordRoute());
                      },
                      child: Text("Forgot Password"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.replaceRoute(HomeRoute());
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.pushRoute(SignupRoute());
                  },
                  child: Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
